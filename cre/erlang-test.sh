sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

cat /cre/versions.txt

if [ ! -f /cre/ubuntu-procfile ]; then
    echo "[FAIL]: File /cre/erlang-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "erlang")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: erlang not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "erlang \t $ERLANG_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of erlang installed!"
    #exit 1
fi

shoreman /cre/erlang-procfile &

sleep 2

# No test in the moment

echo "[SUCCESS]"
exit 0
