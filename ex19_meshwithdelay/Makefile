run:
	sbt run -Xmx4G

test:
	sbt test

onlytest:
	sbt "testOnly gemmini.PE_tb" -Xmx4G

clean:
	rm -rf test_run_dir
	rm -rf project
	rm -rf target