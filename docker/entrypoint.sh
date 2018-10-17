#!/bin/bash
jupyter notebook --ip=0.0.0.0 --allow-root --NotebookApp.token= &> /dev/null &


exec "$@"