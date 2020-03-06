set -e
mkdir -p test
for i in {1..30}
do
./evolution 20 20 1000 1000 1 1 444324$i 25776534 9542461 1 | sed --expression='$!d' >test/Seed1Test$i; diff testBase/Seed1Test$i test/Seed1Test$i
./evolution 20 20 1000 1000 1 1 444324 25776534$i 9542461 1 | sed --expression='$!d' >test/Seed2Test$i; diff testBase/Seed1Test$i test/Seed1Test$i
./evolution 20 20 1000 1000 1 1 444324 25776534 9542461$i 1 | sed --expression='$!d' >test/Seed3Test$i; diff testBase/Seed1Test$i test/Seed1Test$i
./evolution 20 20 1000 1000 1 1 444324$i 25776534 9542461$i 1 | sed --expression='$!d' >test/Seed13Test$i; diff testBase/Seed1Test$i test/Seed1Test$i
./evolution 20 20 1000 1000 1 1 444324$i 25776534$i 9542461$i 1 | sed --expression='$!d' >test/Seed123Test$i; diff testBase/Seed1Test$i test/Seed1Test$i
done
./evolution 1 1 1000000 1000 5 10 444324 25776534 9542462 5 | sed --expression='$!d' >test/OneTileTest; diff testBase/OneTileTest test/OneTileTest
./evolution 2 2 500000 1000 10 10 434324 25776533 9542462 5 | sed --expression='$!d' >test/2x2TileTest; diff testBase/2x2TileTest test/2x2TileTest
./evolution 1000 1000 100 1000 5 10 444324 25776534 9542462 5 | sed --expression='$!d' >test/BigTest; diff testBase/BigTest test/BigTest
./evolution 1000 1000 100 1000 0 0 444324 25776534 9542462 2000000 | sed --expression='$!d' >testBase/AllDeadTest;  diff testBase/BigTest test/BigTest
echo "Todos los test completados con éxito"
