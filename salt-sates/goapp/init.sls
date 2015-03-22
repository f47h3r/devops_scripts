include:
  - mongodb

deps:
  pkg:
    - installed
    - names:
      - git
      - golang
      - mercurial
      - bzr

/opt/golang:
  file.directory:
    - mode: 755
    - makedirs: True
    - require:
      - pkg: golang

installapp:
  cmd.run:
    - name: go get github.com/f47h3r/stoplight
    - require:
      - pkg: git
      - pkg: bzr
      - pkg: mercurial
    - env: 
      - 'GOPATH': '/opt/golang'

run app:
  cmd.run:
    - name: go run app.go >/dev/null 2>&1 &
    - cwd: /opt/golang/src/github.com/f47h3r/stoplight
    - env:
      - 'GOPATH': '/opt/golang'
