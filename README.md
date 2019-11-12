# RequirementsTxt

![](https://raw.githubusercontent.com/juancarlospaco/nim-requirementstxt/master/temp.png)

![](https://img.shields.io/github/languages/count/juancarlospaco/nim-requirementstxt?logoColor=green&style=for-the-badge)
![](https://img.shields.io/github/languages/top/juancarlospaco/nim-requirementstxt?style=for-the-badge)
![](https://img.shields.io/github/stars/juancarlospaco/nim-requirementstxt?style=for-the-badge)
![](https://img.shields.io/maintenance/yes/2019?style=for-the-badge)
![](https://img.shields.io/github/languages/code-size/juancarlospaco/nim-requirementstxt?style=for-the-badge)
![](https://img.shields.io/github/issues-raw/juancarlospaco/nim-requirementstxt?style=for-the-badge)
![](https://img.shields.io/github/issues-pr-raw/juancarlospaco/nim-requirementstxt?style=for-the-badge)
![](https://img.shields.io/github/commit-activity/y/juancarlospaco/nim-requirementstxt?style=for-the-badge)
![](https://img.shields.io/github/last-commit/juancarlospaco/nim-requirementstxt?style=for-the-badge)
![](https://img.shields.io/liberapay/patrons/juancarlospaco?style=for-the-badge)
![](https://sloc.xyz/github/juancarlospaco/nim-requirementstxt?category=code)


- Python [`requirements.txt`](https://pip.readthedocs.io/en/1.1/requirements.html#requirements-file-format) generic iterator parser for [Nim.](https://nim-lang.org)
- Python `RECORDS` file parser, is a custom header-less CSV file used by Python packages.
- *No Regex used in the making of this film!*


# Use

```nim
for it in requirements("requirements.txt"):  ## requirements is string
  echo it

for it in requirements(open("requirements.txt")): ## requirements is File
  echo it

for it in requirements(newStringStream(staticRead("requirements.txt"))): ## requirements is StringStream
  echo it
```

1 Input argument can be `filename: string | StringStream | File`. Based from the official spec: https://pip.readthedocs.io/en/1.1/requirements.html


### Output

Yields 1 `tuple` per parsed line:

* `line` Current line being parsed (`42`, etc).
* `editable` Boolean whether this requirement is *"editable"*.
* `specifier` Boolean whether a version specifier is used (`"flask>=1.5"` is `true`, `"flask"` is `false`)
* `vcs` Distributed version control system used (`"git"`, `"hg"`, etc).
* `protocol` Network protocol for transports (`"http"`, `"https"`, `"ssh"`, etc)
* `name` Package name parsed (`"pytest"`, etc).
* `version` Package version string (`"1.2.9"`, etc).
* `uri` URL if this requirement of `Uri` type (`"https://github.com/user/repo.git"`, etc).
* `extras` Sequence of strings with a list of extras (`"flask[extra1, extra2]"` is `@["extra1", "extra2"]`)
* `blanks` Current count of comments, blank lines, empty lines, etc (`42`, etc).
* `private` Current count of Private custom repositories (Not PYPI).
* `nested` Current count of recursively Nested requirements.txt files (`42`, etc).

**Example Output:**

```nim
(line: 9, editable: false, specifier: true, vcs: "git", protocol: "https", version: "1.6.0", name: "numpy", url: "https://github.com/user/repo.git", blanks: 1, nested: 0, private: 0, extras: @["full", "pdf"])
```

If you need a `seq` of `tuple` use `sequtils.toSeq`. It uses [Effects Tags](https://nim-lang.org/docs/manual.html#effect-system) `ReadIOEffect, WriteIOEffect`.


# Install

```
nimble install requirementstxt
```


# Test

```console
$ nimble test

[Suite] Requirements.txt generic parser tests
  [OK] Big requirements.txt parsing
  [OK] Empty requirements.txt parsing
  [OK] Empty requirements.txt parsing 2
   Success: Execution finished
   Success: All tests passed

```

Test is using a [big and complex `requirements.txt`](https://github.com/juancarlospaco/nim-requirementstxt/blob/master/tests/requirements.txt).


# Documentation

- `runnableExamples` included.

```
nim doc requirementstxt.nim
```


# Supported DVCS

- git
- git+https
- git+ssh
- git+git
- hg+http
- hg+https
- hg+static-http
- hg+ssh
- svn
- svn+svn
- svn+http
- svn+https
- svn+ssh
- bzr+http
- bzr+https
- bzr+ssh
- bzr+sftp
- bzr+ftp
- bzr+lp
- No DVCS


# Requisites

- **None.**


# Dependencies

- **None.**


## Stars

![Stars over time](https://starchart.cc/juancarlospaco/nim-requirementstxt.svg)


# FAQ

- Why a generic iterator ?.

Generic so you can use `string` or `StringStream` or `File`.

`iterator` because `requirements.txt` are meant to have 1 dependency per line.

If you are familiar with Python, Nim `iterator` is like Python `generator`, Nim `tuple` is like Python `NamedTuple`.


[  ⬆️  ⬆️  ⬆️  ⬆️  ](#RequirementsTxt "Go to top")
