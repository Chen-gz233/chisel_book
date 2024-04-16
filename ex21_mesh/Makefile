run:
	sbt run -Xmx4G

test:
	sbt test

test1:
	sbt "testOnly gemmini.PE_tb"

test2:
	sbt "testOnly gemmini.PETester"

test3:
	sbt "testOnly gemmini.TileSpec"

test4:
	sbt "testOnly gemmini.MeshSpec"
clean:
	rm -rf test_run_dir
	rm -rf project
	rm -rf target