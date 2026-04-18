#!/bin/sh
APP_HOME="${0%"${0##*/}"}"
APP_HOME=$(cd "${APP_HOME:-.}" && pwd -P)
APP_NAME="Gradle"
APP_BASE_NAME="${0##*/}"
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'
MAX_FD=maximum
die() { echo; echo "$*"; echo; exit 1; } >&2
cygwin=false; msys=false; darwin=false; nonstop=false
case "$(uname)" in CYGWIN*) cygwin=true;; Darwin*) darwin=true;; MSYS*|MINGW*) msys=true;; NONSTOP*) nonstop=true;; esac
CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
if [ -n "$JAVA_HOME" ]; then
    JAVACMD="$JAVA_HOME/bin/java"
    [ -x "$JAVACMD" ] || die "JAVA_HOME is set to an invalid directory: $JAVA_HOME"
else
    JAVACMD=java
    command -v java >/dev/null 2>&1 || die "JAVA_HOME not set and 'java' not found in PATH."
fi
if ! "$cygwin" && ! "$darwin" && ! "$nonstop"; then
    case $MAX_FD in max*) MAX_FD=$(ulimit -H -n) || true;; esac
    case $MAX_FD in ''|soft) :;; *) ulimit -n "$MAX_FD" || true;; esac
fi
eval "set -- $(printf '%s\n' "$DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS" | xargs -n1 | sed 's~[^a-zA-Z0-9/=@._-]~\\&~g' | tr '\n' ' ')" '"$@"'
exec "$JAVACMD" "-Dorg.gradle.appname=$APP_BASE_NAME" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
