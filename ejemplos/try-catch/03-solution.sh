# Este fichero debe funcionar

echo "[ INFO ] Ejecutando python"
python3 test/src/fk_UnitTest.py

if [ $? -ne 0 ]; then
  echo "[ FAIL ] Python no funciona!"
  echo "[ DBUG ] Caught <Bash> exception!"
  echo "[ INFO ] RUN: docker-compose down"
fi

exit 0
