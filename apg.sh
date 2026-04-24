#!/bin/sh
# shellcheck source=/dev/null
#
# a simple pkgmgr written in posix.
# for afs (astronix from scratch)
# made with love by ilkayBedrock
# #stopusingai
# ^^^^^^^^^^^^
# apg start

echo "hi! which package you wanna install?"
read package
echo "you are installing: $package"
echo "is this correct? (y/n)"
read slt
case $slt in y)
        echo "okay, please set the APG_REPO_PREFIX environment variable to the folder which contains the repos (ctrl+c to exit, enter to continue)"
        read dummy1
        echo "continuing"
        echo "finding the package that you wanna install on $APG_REPO_PREFIX ... (will result empty if package is not found.
ctrl+c to exit in that case)"
        echo "found: $(find $APG_REPO_PREFIX -name $package*.tar*)"
        echo "is that correct? (y/n)"
        read slt2
        case $slt2 in y)
                echo "okay"
                echo "untarring that file..."
                rm -rfv $APG_REPO_PREFIX/$package*/
                tar xpvf $(find $APG_REPO_PREFIX -name $package*.tar*) -C $APG_REPO_PREFIX || exit 1
                echo "untarring done with no problems"
                echo "compiling the source..."
                sleep 1
                cd $APG_REPO_PREFIX/$package*/
                echo "okay, please set the APG_PREFIX environment variable to the folder which contains the build file and install file of this package. this should look like this: /home/ilkay/apg/neovim. this folder needs to contain install.txt and
build.txt. (ctrl+c to exit, enter to continue)"
                read dummy2
                set -e
                . $APG_PREFIX/$package/build.txt
                echo "compiling done successfully"
                echo "do you want to install the program? (y/n)"
                read slt3
                case $slt3 in y)
                        echo "okay"
                        . $APG_PREFIX/$package/install.txt
                        echo "installing the program succeed"
                        echo "press enter to exit"
                        read dummy3
                        sleep 1
                        exit
                esac
                case $slt3 in n)
                        echo "okay, done only compiling successfully"
                        echo "press enter to exit"
                        read dummy4
                        sleep 1
                        exit
                esac
        esac
        case $slt2 in n)
                echo "exiting..."
                sleep 1
                exit
        esac
esac
case $slt in n)
        echo "exiting..."
        sleep 1
        exit
esac

# apg end
