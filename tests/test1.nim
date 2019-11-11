import unittest, streams, uri, ../src/requirementstxt


const requirement = """
# Copyright (c) 2012, Crate and individual contributors.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


# Comment

numpy==1.16.*
matplotlib==3.*
seaborn==0.8.1
pandas
MyApp
Framework==0.9.4
Library>=0.2
django>=1.0,<3.0
reportlab[pdf]>42.0

# Comment

-e git+git://git.myproject.org/MyProject#egg=MyProject
-e git+https://git.myproject.org/MyProject#egg=MyProject
-e git+ssh://git.myproject.org/MyProject#egg=MyProject
-e git+ssh://git@git.myproject.org/MyProject#egg=MyProject
-e git://git.myproject.org/MyProject.git@master#egg=MyProject
-e git://git.myproject.org/MyProject.git@v1.0#egg=MyProject
-e git://git.myproject.org/MyProject.git@da39a3ee5e6b4b0d3255bfef95601890afd80709#egg=MyProject


--extra-index-url=http://dist.pinaxproject.com/dev/

Babel==0.9.6
Django==1.4
Jinja2==2.6
MarkupSafe==0.15
South==0.7.5
amqplib==1.0.2
anyjson==0.3.3
bleach==1.1.1
boto==2.3.0
celery==2.5.5
celery-haystack==0.4
certifi==0.0.8
chardet==1.0.1
-e git+https://github.com/crateio/crate.web.git#egg=crate.web
-e git+https://github.com/crateio/crate.pypi.git#egg=crate.pypi
eventlet==0.9.16
django-admin-tools==0.4.1
django-appconf==0.5
django-celery==2.5.5
-e git+https://github.com/toastdriven/django-haystack.git#egg=django-haystack
django-hosts==0.4.2
django-jsonfield==0.8.7
django-model-utils==1.1.0
django-picklefield==0.2.1
django-redis-cache==0.9.3
django-secure==0.1.2
django-social-auth==0.6.9
django-staticfiles==1.2.1
django-storages==1.1.4
django-tastypie==0.9.11
-e git://github.com/dstufft/django-user-accounts.git#egg=django-user-accounts
django-uuidfield==0.2
docutils==0.9.1
greenlet==0.4.0
gunicorn==0.14.5
html5lib==0.95
httplib2==0.7.4
isoweek==1.2.0
jingo==0.4
-e git+https://github.com/dstufft/jutils.git#egg=jutils
kombu==2.1.8
lxml==2.3.4
mimeparse==0.1.3
newrelic==1.2.1.265
oauth2==1.5.211
oauthlib==0.1.3
pinax-utils==1.0b1.dev3
psycopg2==2.4.5
py-bcrypt==0.2
pyasn1==0.1.3
-e git+https://github.com/toastdriven/pyelasticsearch.git#egg=pyelasticsearch
python-dateutil==1.5
python-openid==2.2.5
pytz==2012c
PyYAML==3.10
raven==1.7.6
redis==2.4.12
requests==0.12.1
rsa==3.0.1
-e git+https://github.com/toastdriven/saved_searches.git#egg=saved_searches
simplejson==2.5.2
slumber==0.4.2
uuid==1.30




"""

const results = """@[(line: 0, editable: false, specifier: true, vcs: "", protocol: "", version: "1.16.*", name: "numpy", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 1, editable: false, specifier: true, vcs: "", protocol: "", version: "3.*", name: "matplotlib", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 2, editable: false, specifier: true, vcs: "", protocol: "", version: "0.8.1", name: "seaborn", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 3, editable: false, specifier: false, vcs: "", protocol: "", version: "", name: "pandas", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 4, editable: false, specifier: false, vcs: "", protocol: "", version: "", name: "MyApp", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 5, editable: false, specifier: true, vcs: "", protocol: "", version: "0.9.4", name: "Framework", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 6, editable: false, specifier: true, vcs: "", protocol: "", version: "0.2", name: "Library", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 7, editable: false, specifier: true, vcs: "", protocol: "", version: "1.0,<3.0", name: "django", url: , blanks: 27, nested: 0, private: 0, extras: @[""]), (line: 8, editable: false, specifier: true, vcs: "", protocol: "", version: "42.0", name: "reportlab[pdf]", url: , blanks: 27, nested: 0, private: 0, extras: @["pdf"]), (line: 9, editable: true, specifier: false, vcs: "git", protocol: "git", version: "", name: "-e git+git://git.myproject.org/MyProject#egg=MyProject", url: git://git.myproject.org/MyProject#egg=MyProject, blanks: 30, nested: 0, private: 0, extras: @[""]), (line: 10, editable: true, specifier: false, vcs: "git", protocol: "https", version: "", name: "-e git+https://git.myproject.org/MyProject#egg=MyProject", url: https://git.myproject.org/MyProject#egg=MyProject, blanks: 30, nested: 0, private: 0, extras: @[""]), (line: 11, editable: true, specifier: false, vcs: "git", protocol: "ssh", version: "", name: "-e git+ssh://git.myproject.org/MyProject#egg=MyProject", url: ssh://git.myproject.org/MyProject#egg=MyProject, blanks: 30, nested: 0, private: 0, extras: @[""]), (line: 12, editable: true, specifier: false, vcs: "git", protocol: "ssh", version: "", name: "-e git+ssh://git@git.myproject.org/MyProject#egg=MyProject", url: ssh://git@git.myproject.org/MyProject#egg=MyProject, blanks: 30, nested: 0, private: 0, extras: @[""]), (line: 13, editable: true, specifier: false, vcs: "", protocol: "", version: "", name: "-e git://git.myproject.org/MyProject.git@master#egg=MyProject", url: , blanks: 30, nested: 0, private: 0, extras: @[""]), (line: 14, editable: true, specifier: false, vcs: "", protocol: "", version: "", name: "-e git://git.myproject.org/MyProject.git@v1.0#egg=MyProject", url: , blanks: 30, nested: 0, private: 0, extras: @[""]), (line: 15, editable: true, specifier: false, vcs: "", protocol: "", version: "", name: "-e git://git.myproject.org/MyProject.git@da39a3ee5e6b4b0d3255bfef95601890afd80709#egg=MyProject", url: , blanks: 30, nested: 0, private: 0, extras: @[""]), (line: 17, editable: false, specifier: true, vcs: "", protocol: "", version: "0.9.6", name: "Babel", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 18, editable: false, specifier: true, vcs: "", protocol: "", version: "1.4", name: "Django", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 19, editable: false, specifier: true, vcs: "", protocol: "", version: "2.6", name: "Jinja2", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 20, editable: false, specifier: true, vcs: "", protocol: "", version: "0.15", name: "MarkupSafe", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 21, editable: false, specifier: true, vcs: "", protocol: "", version: "0.7.5", name: "South", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 22, editable: false, specifier: true, vcs: "", protocol: "", version: "1.0.2", name: "amqplib", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 23, editable: false, specifier: true, vcs: "", protocol: "", version: "0.3.3", name: "anyjson", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 24, editable: false, specifier: true, vcs: "", protocol: "", version: "1.1.1", name: "bleach", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 25, editable: false, specifier: true, vcs: "", protocol: "", version: "2.3.0", name: "boto", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 26, editable: false, specifier: true, vcs: "", protocol: "", version: "2.5.5", name: "celery", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 27, editable: false, specifier: true, vcs: "", protocol: "", version: "0.4", name: "celery-haystack", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 28, editable: false, specifier: true, vcs: "", protocol: "", version: "0.0.8", name: "certifi", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 29, editable: false, specifier: true, vcs: "", protocol: "", version: "1.0.1", name: "chardet", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 30, editable: true, specifier: false, vcs: "git", protocol: "https", version: "", name: "-e git+https://github.com/crateio/crate.web.git#egg=crate.web", url: https://github.com/crateio/crate.web.git#egg=crate.web, blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 31, editable: true, specifier: false, vcs: "git", protocol: "https", version: "", name: "-e git+https://github.com/crateio/crate.pypi.git#egg=crate.pypi", url: https://github.com/crateio/crate.pypi.git#egg=crate.pypi, blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 32, editable: false, specifier: true, vcs: "", protocol: "", version: "0.9.16", name: "eventlet", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 33, editable: false, specifier: true, vcs: "", protocol: "", version: "0.4.1", name: "django-admin-tools", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 34, editable: false, specifier: true, vcs: "", protocol: "", version: "0.5", name: "django-appconf", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 35, editable: false, specifier: true, vcs: "", protocol: "", version: "2.5.5", name: "django-celery", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 36, editable: true, specifier: false, vcs: "git", protocol: "https", version: "", name: "-e git+https://github.com/toastdriven/django-haystack.git#egg=django-haystack", url: https://github.com/toastdriven/django-haystack.git#egg=django-haystack, blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 37, editable: false, specifier: true, vcs: "", protocol: "", version: "0.4.2", name: "django-hosts", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 38, editable: false, specifier: true, vcs: "", protocol: "", version: "0.8.7", name: "django-jsonfield", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 39, editable: false, specifier: true, vcs: "", protocol: "", version: "1.1.0", name: "django-model-utils", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 40, editable: false, specifier: true, vcs: "", protocol: "", version: "0.2.1", name: "django-picklefield", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 41, editable: false, specifier: true, vcs: "", protocol: "", version: "0.9.3", name: "django-redis-cache", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 42, editable: false, specifier: true, vcs: "", protocol: "", version: "0.1.2", name: "django-secure", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 43, editable: false, specifier: true, vcs: "", protocol: "", version: "0.6.9", name: "django-social-auth", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 44, editable: false, specifier: true, vcs: "", protocol: "", version: "1.2.1", name: "django-staticfiles", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 45, editable: false, specifier: true, vcs: "", protocol: "", version: "1.1.4", name: "django-storages", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 46, editable: false, specifier: true, vcs: "", protocol: "", version: "0.9.11", name: "django-tastypie", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 47, editable: true, specifier: false, vcs: "", protocol: "", version: "", name: "-e git://github.com/dstufft/django-user-accounts.git#egg=django-user-accounts", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 48, editable: false, specifier: true, vcs: "", protocol: "", version: "0.2", name: "django-uuidfield", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 49, editable: false, specifier: true, vcs: "", protocol: "", version: "0.9.1", name: "docutils", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 50, editable: false, specifier: true, vcs: "", protocol: "", version: "0.4.0", name: "greenlet", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 51, editable: false, specifier: true, vcs: "", protocol: "", version: "0.14.5", name: "gunicorn", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 52, editable: false, specifier: true, vcs: "", protocol: "", version: "0.95", name: "html5lib", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 53, editable: false, specifier: true, vcs: "", protocol: "", version: "0.7.4", name: "httplib2", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 54, editable: false, specifier: true, vcs: "", protocol: "", version: "1.2.0", name: "isoweek", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 55, editable: false, specifier: true, vcs: "", protocol: "", version: "0.4", name: "jingo", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 56, editable: true, specifier: false, vcs: "git", protocol: "https", version: "", name: "-e git+https://github.com/dstufft/jutils.git#egg=jutils", url: https://github.com/dstufft/jutils.git#egg=jutils, blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 57, editable: false, specifier: true, vcs: "", protocol: "", version: "2.1.8", name: "kombu", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 58, editable: false, specifier: true, vcs: "", protocol: "", version: "2.3.4", name: "lxml", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 59, editable: false, specifier: true, vcs: "", protocol: "", version: "0.1.3", name: "mimeparse", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 60, editable: false, specifier: true, vcs: "", protocol: "", version: "1.2.1.265", name: "newrelic", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 61, editable: false, specifier: true, vcs: "", protocol: "", version: "1.5.211", name: "oauth2", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 62, editable: false, specifier: true, vcs: "", protocol: "", version: "0.1.3", name: "oauthlib", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 63, editable: false, specifier: true, vcs: "", protocol: "", version: "1.0b1.dev3", name: "pinax-utils", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 64, editable: false, specifier: true, vcs: "", protocol: "", version: "2.4.5", name: "psycopg2", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 65, editable: false, specifier: true, vcs: "", protocol: "", version: "0.2", name: "py-bcrypt", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 66, editable: false, specifier: true, vcs: "", protocol: "", version: "0.1.3", name: "pyasn1", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 67, editable: true, specifier: false, vcs: "git", protocol: "https", version: "", name: "-e git+https://github.com/toastdriven/pyelasticsearch.git#egg=pyelasticsearch", url: https://github.com/toastdriven/pyelasticsearch.git#egg=pyelasticsearch, blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 68, editable: false, specifier: true, vcs: "", protocol: "", version: "1.5", name: "python-dateutil", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 69, editable: false, specifier: true, vcs: "", protocol: "", version: "2.2.5", name: "python-openid", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 70, editable: false, specifier: true, vcs: "", protocol: "", version: "2012c", name: "pytz", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 71, editable: false, specifier: true, vcs: "", protocol: "", version: "3.10", name: "PyYAML", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 72, editable: false, specifier: true, vcs: "", protocol: "", version: "1.7.6", name: "raven", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 73, editable: false, specifier: true, vcs: "", protocol: "", version: "2.4.12", name: "redis", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 74, editable: false, specifier: true, vcs: "", protocol: "", version: "0.12.1", name: "requests", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 75, editable: false, specifier: true, vcs: "", protocol: "", version: "3.0.1", name: "rsa", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 76, editable: true, specifier: false, vcs: "git", protocol: "https", version: "", name: "-e git+https://github.com/toastdriven/saved_searches.git#egg=saved_searches", url: https://github.com/toastdriven/saved_searches.git#egg=saved_searches, blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 77, editable: false, specifier: true, vcs: "", protocol: "", version: "2.5.2", name: "simplejson", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 78, editable: false, specifier: true, vcs: "", protocol: "", version: "0.4.2", name: "slumber", url: , blanks: 33, nested: 0, private: 1, extras: @[""]), (line: 79, editable: false, specifier: true, vcs: "", protocol: "", version: "1.30", name: "uuid", url: , blanks: 33, nested: 0, private: 1, extras: @[""])]"""


suite "Requirements.txt generic parser tests":

  test "Big requirements.txt parsing":
    var expecteds: seq[tuple[line: byte, editable, specifier: bool, vcs, protocol, version, name: string, url: Uri, blanks, nested, private: byte, extras: seq[string]]]
    for item in requirements(newStringStream(requirement)): expecteds.add item
    check $expecteds == results

  test "Empty requirements.txt parsing":
    var expecteds2: seq[tuple[line: byte, editable, specifier: bool, vcs, protocol, version, name: string, url: Uri, blanks, nested, private: byte, extras: seq[string]]]
    for item in requirements(newStringStream("")): expecteds2.add item
    check expecteds2.len == 0

  test "Empty requirements.txt parsing 2":
    var expecteds3: seq[tuple[line: byte, editable, specifier: bool, vcs, protocol, version, name: string, url: Uri, blanks, nested, private: byte, extras: seq[string]]]
    for item in requirements(newStringStream("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")): expecteds3.add item
    check expecteds3.len == 0
