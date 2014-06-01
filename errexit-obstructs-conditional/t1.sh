# http://lists.gnu.org/archive/html/bug-bash/2012-12/msg00099.html
# https://groups.google.com/forum/?fromgroups=#!topic/gnu.bash.bug/NCK_0GmIv2M

# set -o errexit #Don't use set -e or set -o errexit
set -o nounset
set -o errtrace

NON_EXISTANT_ENVIRONMENT_VARIABLE="$(printenv NON_EXISTANT_ENVIRONMENT_VARIABLE)"
if test -z "$NON_EXISTANT_ENVIRONMENT_VARIABLE"
then
    # We never reach this point even though
    # $NON_EXISTANT_ENVIRONMENT_VARIABLE is zero length because
    # $(printenv NON_EXISTANT_ENVIRONMENT_VARIABLE) causes error and
    # script would error out if we use set -o errtrace or set -e

    echo 'set NON_EXISTANT_ENVIRONMENT_VARIABLE environment variable first (eg NON_EXISTANT_ENVIRONMENT_VARIABLE=D:)'
    exit 1
fi
