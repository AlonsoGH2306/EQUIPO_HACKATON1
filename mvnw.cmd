@echo off
set MVN_VERSION=3.9.9
set BASE=%~dp0
set MVN_HOME=%BASE%.mvn\apache-maven-%MVN_VERSION%
if not exist "%MVN_HOME%\bin\mvn.cmd" (
  powershell -NoProfile -Command "$u='https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/%MVN_VERSION%/apache-maven-%MVN_VERSION%-bin.zip'; Invoke-WebRequest $u -OutFile '%BASE%.mvn\maven.zip'; Expand-Archive -Force '%BASE%.mvn\maven.zip' '%BASE%.mvn'"
)
call "%MVN_HOME%\bin\mvn.cmd" %*
