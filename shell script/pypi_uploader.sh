#!bin/bash

check_python()
{
    if which python3 >/dev/null;
    then
        echo "Python3 is installed. Skipping Python Installation..."
    else
        echo "Installing Python3..."
        sudo apt install python3 -y
    fi
}

check_pip()
{
    if which python-pip3 >/dev/null;
    then
        echo "pip3 is installed. Skipping pip3 Installation..."
    else
        echo "installing pip3..."
        sudo apt install python3-pip -y
    fi
}

create_dist()
{
    pip3 install twine
    python3 setup.py sdist
}

up_testpypi()
{
    while :
    do
        echo "TEST PYPI UPLOAD WIZARD"
        echo -n "Please check if your source code is bug-free before proceeding.Attempt to proceed(Y/N):  "
        read flag1
        if [[ $flag1 == "y" || $flag1 == "Y" ]]
        then
            echo "Uploading to test pypi..."
            twine upload --repository testpypi --username $1 --password $2 dist/*
            echo "Uploaded to test pypi."
            echo "Please verify the test pypi package before proceeding to actual pypi package upload."
            break
        elif [[ $flag1 == "n" || $flag1 == "N" ]]
        then
            echo "Please verify the source code and try again."
        fi
    done
}

up_pypi()
{
    while :
    do
        echo "PYPI UPLOAD WIZARD"
        echo -n "Please check if your test-pypi package is bug-free before proceeding.Attempt to proceed(Y/N):  "
        read flag2
        if [[ $flag2 == "y" || $flag2 == "Y" ]]
        then
            echo "Uploading to pypi..."
            twine upload --username $1 --password $2 dist/*
            echo "Uploaded to pypi."
            break
        elif [[ $flag2 == "n" || $flag2 == "N" ]]
        then
            echo "Please verify the test-pypi package and try again."
        fi
    done
}

echo " "
echo "PYPI Upload Tester"
echo " "
echo "Before we proceed, Kindly enter your Pypi Username and Password."
echo " "
echo -n "Username: "
read name
echo -n "Password: "
read -s pass
echo " "
REQ_FILE = setup.py
if [ -f $REQ_FILE ]
then
    echo "Checking dependencies and verifying their installation..."
    check_python
    check_pip
    create_dist

    echo -n "Do you want to upload to test-pypi?(Y/N): "
    read opt1
    if [[ $opt1 == 'Y' || $opt1 == 'y' ]]
    then
        up_testpypi $name $pass
    elif [[ $opt1 == 'n' || $opt1 == 'N' ]]
    then
        echo "Test-pypi upload cancelled."
    fi

    echo -n "Do you want to upload to main pypi?(Y/N): "
    read opt2
    if [[ $opt2 == 'y' || $opt2 == 'Y' ]]
    then
        up_pypi $name $pass
    elif [[ $opt2 == 'n' || $opt2 == 'N' ]]
    then
        echo "Pypi upload cancelled."
    fi
else
    echo "Unable to find setup.py in the current directory."
    echo "Please move the script to the directory where setup.py exists."
fi
