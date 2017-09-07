#/bin/bash

if [ $# -eq 0 ]; then
    # load default module
    echo "Loading default module.."
    CARDS_SETTINGS=./mod-default.cfg
else
    # Run default module in debugging mode.
    if [ "$1" = "dev" ]; then
        echo "Running default module in dev mode .."
        export FLASK_APP=wsgi.py
        export FLASK_DEBUG=1
        flask run
        exit 0
    fi
    # load specified module
    if [ ! -f "./mod-$1.cfg" ]; then
        echo "mod-$1.cfg: Configuration file not found."
        exit 1
    else
        echo "Loading module $1 .. "
        CARDS_SETTINGS="./mod-$1.cfg"
    fi

fi

export CARDS_SETTINGS #="$CARDS_SETTINGS"
# Run the flask app
python wsgi.py


