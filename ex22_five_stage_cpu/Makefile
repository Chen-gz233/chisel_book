test:
	sbt "testOnly CPUTester"

pctest:
	sbt "testOnly PCTester"
regbankstest:
	sbt "testOnly RegBanksTester"

instructioncachetest:
	sbt "testOnly Instruction_CacheTester"

instructiondecodetest:
	sbt "testOnly InstructionDecodeTester"

controllertest:
	sbt "testOnly ControllerTester"

immediategeneratortest:
	sbt "testOnly Immediate_GeneratorTester"

mux2test:
	sbt "testOnly Mux2Tester"

mux3test:
	sbt "testOnly Mux3Tester"

alutest:
	sbt "testOnly ALUTester"

dcachetest:
	sbt "testOnly Data_CacheTester"

nextpctest:
	sbt "testOnly NextPCTester"


run:
	sbt run 

clean:
	rm -rf generate/*
	rm -rf test_run_dir/*