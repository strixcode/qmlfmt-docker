#!/bin/bash

if [[ "$PUID" -eq 0 ]]; then
    "$@"
    exit $?
fi

if [[ "$PGID" -ne 1000 ]] || [[ "$PUID" -ne 1000 ]]; then
    userdel user
    groupadd --gid $PGID user
    useradd -s /bin/bash --uid $PUID --gid $PGID user
fi

echo "#!/bin/bash" > run.sh
echo "$@" >> run.sh
chmod +x run.sh
su -g user user -c ./run.sh
exit $?
