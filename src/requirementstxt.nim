import strutils, os, uri, parsecsv, streams

iterator requirements*(filename: string | StringStream | File, versionReplace: openArray[tuple] = []):
  tuple[line: byte, editable: bool, specifier, vcs, protocol, version, name: string, url: Uri, blanks, nested, private: byte, extras: seq[string]] {.tags: [ReadIOEffect, WriteIOEffect].} =
  ## Python ``requirements.txt`` iterator parser for Nim.
  ## This and ``requirements.txt`` supports it, but ``setup.py`` does not: ``git+https://github.com/user/repo.git@master#egg=loggable``.
  ## Based from the official spec: https://pip.readthedocs.io/en/1.1/requirements.html
  ##
  ## * ``line`` Current line being parsed.
  ## * ``editable`` Boolean whether this requirement is "editable".
  ## * ``specifier`` String version specifier is used (For "flask>=1.5" is ">=")
  ## * ``vcs`` Distributed version control system used (git, hg, etc).
  ## * ``protocol`` Network protocol for transports (http, https, ssh, etc)
  ## * ``name`` Package name parsed.
  ## * ``version`` Package version string ("1.2.9", etc).
  ## * ``uri`` URL if this requirement of ``Uri`` type ("https://github.com/user/repo.git", etc).
  ## * ``extras`` Sequence of strings with a list of extras ("flask[extra1, extra2]" is ["extra1", "extra2"])
  ## * ``blanks`` Current count of comments, blank lines, empty lines, etc.
  ## * ``private`` Current count of Private custom repositories (Not PYPI). Private repos not supported.
  ## * ``nested`` Current count of recursively Nested requirements.txt files. Nested requirements not supported.
  runnableExamples:
    for it in requirements("requirements.txt"): echo it       ## requirements is string
    for it in requirements(open("requirements.txt")): echo it ## requirements is File
  var f = when filename is File or filename is StringStream: filename else: open(filename)
  when filename isnot File:
    defer: close(f)
  var i, b, n, p: byte
  var line, linelow, e: string
  while f.readLine(line):
    var result = (line: i, editable: false, specifier: string, vcs: "", protocol: "", version: "", name: "", url: parseUri(""), blanks: b, nested: n, private: p, extras: @[""])
    inc i
    linelow = line.toLowerAscii.strip  # line lowercased for comparisons.
    if unlikely(linelow.len == 0 or linelow.startsWith('#') or linelow.startsWith("-z") or linelow.startsWith("--always-unzip")):
      inc b # Comments, blank lines, empty lines, etc.
      dec i
      continue
    elif unlikely(linelow.startsWith("-r ") or linelow.startsWith("--requirement ")):
      inc n  # Nested requirements not supported.
      continue  # requirements(getCurrentDir() / line.split()[1])  # TODO: What to do???
    elif unlikely(linelow.startsWith("-f") or linelow.startsWith("--find-links") or linelow.startsWith("-i") or
      linelow.startsWith("--index-url") or linelow.startsWith("--extra-index-url") or linelow.startsWith("--no-index")):
      inc p # Private repos not supported.
      continue
    result.editable = linelow.startsWith("-e ")
    e = if result.editable: "-e " else: ""
    # Git
    if likely(linelow.startsWith(e & "git+")):
      result.vcs = "git"
      result.url = parseUri(line[len(e & "git+")..^1])
      if likely(linelow.startsWith(e & "git+https:")): result.protocol = "https"
      elif unlikely(linelow.startsWith(e & "git+http:")): result.protocol = "http"
      if unlikely(linelow.startsWith(e & "git+git:")): result.protocol = "git"
      elif linelow.startsWith(e & "git+ssh:"): result.protocol = "ssh"
    # HG
    if unlikely(linelow.startsWith(e & "hg+")):
      result.vcs = "hg"
      result.url = parseUri(line[len(e & "hg+")..^1])
      if likely(linelow.startsWith(e & "hg+https:")): result.protocol = "https"
      elif unlikely(linelow.startsWith(e & "hg+http:")): result.protocol = "http"
      elif linelow.startsWith(e & "hg+ssh:"): result.protocol = "ssh"
      elif linelow.startsWith(e & "hg+static-http:"): result.protocol = "static-http"
    # BZR
    if likely(linelow.startsWith(e & "bzr+")):
      result.vcs = "bzr"
      result.url = parseUri(line[len(e & "bzr+")..^1])
      if likely(linelow.startsWith(e & "bzr+https:")): result.protocol = "https"
      elif unlikely(linelow.startsWith(e & "bzr+http:")): result.protocol = "http"
      elif linelow.startsWith(e & "bzr+ssh:"): result.protocol = "ssh"
      elif linelow.startsWith(e & "bzr+sftp:"): result.protocol = "sftp"
      elif linelow.startsWith(e & "bzr+ftp:"): result.protocol = "ftp"
      elif linelow.startsWith(e & "bzr+lp:"): result.protocol = "lp"
    # SVN
    if likely(linelow.startsWith(e & "svn+")):
      result.vcs = "svn"
      result.url = parseUri(line[len(e & "svn+")..^1])
      if likely(linelow.startsWith(e & "svn+https:")): result.protocol = "https"
      elif unlikely(linelow.startsWith(e & "svn+http:")): result.protocol = "http"
      elif linelow.startsWith(e & "svn+ssh:"): result.protocol = "ssh"
      elif linelow.startsWith(e & "svn+svn:"): result.protocol = "svn"
    else: # Non-VCS, just the package name with out without the version
      if unlikely("[" in linelow and "]" in linelow): result.extras = line.strip.split("[")[1].split("]")[0].replace(" ", "").split(",")
      if "==" in linelow:
        result.specifier = "=="
        if linelow.split("==").len == 2:
          result.name = line.split("==")[0]
          result.version = line.split("==")[1]
      elif ">=" in linelow:
        result.specifier = ">="
        if linelow.split(">=").len == 2:
          result.name = line.split(">=")[0]
          result.version = line.split(">=")[1]
      elif "<=" in linelow:
        result.specifier = "<="
        if linelow.split("<=").len == 2:
          result.name = line.split("<=")[0]
          result.version = line.split("<=")[1]
      elif "<" in linelow:
        result.specifier = "<"
        if linelow.split("<").len == 2:
          result.name = line.split("<")[0]
          result.version = line.split("<")[1]
      elif ">" in linelow:
        result.specifier = ">"
        if linelow.split(">").len == 2:
          result.name = line.split(">")[0]
          result.version = line.split(">")[1]
      elif "!=" in linelow:
        result.specifier = "!="
        if linelow.split("!=").len == 2:
          result.name = line.split("!=")[0]
          result.version = line.split("!=")[1]
      else:
        result.name = line.strip
    if unlikely(versionReplace.len > 0): result.version = result.version.multiReplace(versionReplace)
    yield result

proc parseRecord*(filename: string, skipInitialSpace = false): seq[seq[string]] {.inline.} =
  ## Parse ``RECORD`` files from Python packages, they are custom header-less CSV.
  assert filename.len > 0, "filename must not be empty string"
  var parser = create(CsvParser, sizeOf CsvParser)
  parser[].open(filename, skipInitialSpace = skipInitialSpace)
  while readRow(parser[]): result.add parser[].row
  parser[].close()
  dealloc parser
