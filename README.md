# RequirementsTxt

- Python [`requirements.txt`](https://pip.readthedocs.io/en/1.1/requirements.html#requirements-file-format) generic iterator parser for [Nim.](https://nim-lang.org)
- Python `RECORDS` file parser, is a custom header-less CSV file used by Python packages.
- *No Regex used in the making of this film!*

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


# Use

```nim
for it in requirements("requirements.txt"):  ## requirements is string
  echo it

for it in requirements(open("requirements.txt")): ## requirements is File
  echo it

for it in requirements(newStringStream(staticRead("requirements.txt"))): ## requirements is StringStream
  echo it
```


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


# Documentation

```
nim doc requirementstxt.nim
```


# Requisites

- **None.**


# Dependencies

- **None.**


## Stars

![Stars over time](https://starchart.cc/juancarlospaco/nim-requirementstxt.svg)


[  ⬆️  ⬆️  ⬆️  ⬆️  ](#RequirementsTxt "Go to top")
