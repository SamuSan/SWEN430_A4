package whilelang.testing.tests;

import static org.junit.Assert.fail;

import java.io.File;

import org.junit.*;

import whilelang.testing.TestHarness;
import whilelang.testing.TestHarness.StreamGrabber;

public class X86ValidTests extends TestHarness {
	private final static String RUNTIME_LIBRARY = "../../src/whilelang/runtime/runtime.c"
			.replace('/', File.separatorChar);

	public X86ValidTests() {
		super("tests/valid", "tests/valid", "sysout");
	}

	protected void runX86Test(String name) {
		try {
			// First, we need to generate the assembly file
			runJava(srcPath, "whilelang.Main", "-x86", name + ".while");

			// Second, we need to compile the assembly file with gcc
			compileWithGcc(srcPath, name, name + ".s", RUNTIME_LIBRARY);

			// Third, execute the compiled file
			String output = runNative(srcPath, name);
			compare(output, outputPath + File.separatorChar + name + "."
					+ outputExtension);
		} catch (Exception ex) {
			ex.printStackTrace();
			fail("Problem running compiled test");
		}
	}

	public void compileWithGcc(String dir, String target, String... files) {
		try {
			String tmp = "gcc -Wno-format -o " + dir + File.separatorChar + target;
			for (String f : files) {
				tmp += " " + dir + File.separatorChar + f;
			}
			Process p = Runtime.getRuntime().exec(tmp);
			StringBuffer syserr = new StringBuffer();
			StringBuffer sysout = new StringBuffer();
			new StreamGrabber(p.getErrorStream(), syserr);
			new StreamGrabber(p.getInputStream(), sysout);
			int exitCode = p.waitFor();
			System.err.println(syserr); // propagate anything from the error
			// stream
			if (exitCode != 0) {
				System.err
				.println("============================================================");
				System.err.println(tmp);
				System.err
				.println("============================================================");
				fail("Problem running gcc to compile test");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			fail("Problem running gcc to compile test");
		}
	}

	public String runNative(String dir, String executable) {
		try {
			Process p = Runtime.getRuntime().exec(dir + File.separatorChar + executable);
			StringBuffer syserr = new StringBuffer();
			StringBuffer sysout = new StringBuffer();
			new StreamGrabber(p.getErrorStream(), syserr);
			new StreamGrabber(p.getInputStream(), sysout);
			int exitCode = p.waitFor();
			System.err
					.println("============================================================");
			System.err.println(dir + File.separatorChar + executable);
			System.err
					.println("============================================================");
			System.err.println(syserr); // propagate anything from the error
			// stream
			return sysout.toString();
		} catch (Exception ex) {
			ex.printStackTrace();
			fail("Problem running native executable");
			return null;
		}
	}

	@Test
	public void BoolAssign_Valid_1() {
		runX86Test("BoolAssign_Valid_1");
	}
	
	@Test
	public void baseline() {
		runX86Test("baseline");
	}
//
//	@Test
//	public void BoolAssign_Valid_2() {
//		runX86Test("BoolAssign_Valid_2");
//	}
//
//	@Test
//	public void BoolAssign_Valid_3() {
//		runX86Test("BoolAssign_Valid_3");
//	}
//
//	@Test
//	public void BoolAssign_Valid_4() {
//		runX86Test("BoolAssign_Valid_4");
//	}
//
//	@Test
//	public void BoolIfElse_Valid_1() {
//		runX86Test("BoolIfElse_Valid_1");
//	}
//
//	@Test
//	public void BoolIfElse_Valid_2() {
//		runX86Test("BoolIfElse_Valid_2");
//	}
//
//	 @Test
//	public void BoolList_Valid_1() {
//		runX86Test("BoolList_Valid_1");
//	}
//
//	 @Test
//	public void BoolList_Valid_2() {
//		runX86Test("BoolList_Valid_2");
//	}
//
//	@Test
//	public void BoolRecord_Valid_1() {
//		runX86Test("BoolRecord_Valid_1");
//	}
//
//	@Test
//	public void BoolRecord_Valid_2() {
//		runX86Test("BoolRecord_Valid_2");
//	}
//
//	@Test
//	public void BoolReturn_Valid_1() {
//		runX86Test("BoolReturn_Valid_1");
//	}
//
//	 @Test
//	public void Char_Valid_2() {
//		runX86Test("Char_Valid_2");
//	}
//
//	 @Test
//	public void Char_Valid_3() {
//		runX86Test("Char_Valid_3");
//	}
//
//	@Test
//	public void Define_Valid_1() {
//		runX86Test("Define_Valid_1");
//	}
//
//	 @Test
//	public void Define_Valid_2() {
//		runX86Test("Define_Valid_2");
//	}
//
//	@Test
//	public void Function_Valid_1() {
//		runX86Test("Function_Valid_1");
//	}
//
//	@Test
//	public void Function_Valid_2() {
//		runX86Test("Function_Valid_2");
//	}
//
//	@Test
//	public void Function_Valid_4() {
//		runX86Test("Function_Valid_4");
//	}
//
//	@Test
//	public void IfElse_Valid_1() {
//		runX86Test("IfElse_Valid_1");
//	}
//
//	@Test
//	public void IfElse_Valid_2() {
//		runX86Test("IfElse_Valid_2");
//	}
//
//	@Test
//	public void IfElse_Valid_3() {
//		runX86Test("IfElse_Valid_3");
//	}
//
//	@Test
//	public void IntDefine_Valid_1() {
//		runX86Test("IntDefine_Valid_1");
//	}
//
//	@Test
//	public void IntDiv_Valid_1() {
//		runX86Test("IntDiv_Valid_1");
//	}
//
//	@Test
//	public void IntDiv_Valid_2() {
//		runX86Test("IntDiv_Valid_2");
//	}
//
//	@Test
//	public void IntEquals_Valid_1() {
//		runX86Test("IntEquals_Valid_1");
//	}
//
//	@Test
//	public void IntMul_Valid_1() {
//		runX86Test("IntMul_Valid_1");
//	}
//
//	 @Test
//	public void LengthOf_Valid_1() {
//		runX86Test("LengthOf_Valid_1");
//	}
//
//	 @Test
//	public void LengthOf_Valid_5() {
//		runX86Test("LengthOf_Valid_5");
//	}
//
//	 @Test
//	public void ListAccess_Valid_1() {
//		runX86Test("ListAccess_Valid_1");
//	}
//
//	 @Test
//	public void ListAccess_Valid_3() {
//		runX86Test("ListAccess_Valid_3");
//	}
//
//	 @Test
//	public void ListAccess_Valid_4() {
//		runX86Test("ListAccess_Valid_4");
//	}
//
//	 @Test
//	public void ListAppend_Valid_1() {
//		runX86Test("ListAppend_Valid_1");
//	}
//
//	 @Test
//	public void ListAppend_Valid_2() {
//		runX86Test("ListAppend_Valid_2");
//	}
//
//	 @Test
//	public void ListAppend_Valid_3() {
//		runX86Test("ListAppend_Valid_3");
//	}
//
//
//	 @Test
//	public void ListAssign_Valid_1() {
//		runX86Test("ListAssign_Valid_1");
//	}
//
//	 @Test
//	public void ListAssign_Valid_2() {
//		runX86Test("ListAssign_Valid_2");
//	}
//
//	 @Test
//	public void ListAssign_Valid_3() {
//		runX86Test("ListAssign_Valid_3");
//	}
//
//	 @Test
//	public void ListAssign_Valid_4() {
//		runX86Test("ListAssign_Valid_4");
//	}
//
//	 @Test
//	public void ListAssign_Valid_5() {
//		runX86Test("ListAssign_Valid_5");
//	}
//
//	 @Test
//	public void ListAssign_Valid_6() {
//		runX86Test("ListAssign_Valid_6");
//	}
//
//	 @Test
//	public void ListAssign_Valid_10() {
//		runX86Test("ListAssign_Valid_10");
//	}
//
//	 @Test
//	public void ListConversion_Valid_1() {
//		runX86Test("ListConversion_Valid_1");
//	}
//
//	 @Test
//	public void ListEmpty_Valid_1() {
//		runX86Test("ListEmpty_Valid_1");
//	}
//
//	 @Test
//	public void ListEquals_Valid_1() {
//		runX86Test("ListEquals_Valid_1");
//	}
//
//	 @Test
//	public void ListGenerator_Valid_1() {
//		runX86Test("ListGenerator_Valid_1");
//	}
//
//	 @Test
//	public void ListGenerator_Valid_2() {
//		runX86Test("ListGenerator_Valid_2");
//	}
//
//	 @Test
//	public void ListGenerator_Valid_3() {
//		runX86Test("ListGenerator_Valid_3");
//	}
//
//	 @Test
//	public void ListLength_Valid_1() {
//		runX86Test("ListLength_Valid_1");
//	}
//
//	 @Test
//	public void ListLength_Valid_2() {
//		runX86Test("ListLength_Valid_2");
//	}
//
//	 @Test
//	public void RealDiv_Valid_1() {
//		runX86Test("RealDiv_Valid_1");
//	}
//
//	 @Test
//	public void RealDiv_Valid_3() {
//		runX86Test("RealDiv_Valid_3");
//	}
//
//	 @Test
//	public void RealDiv_Valid_4() {
//		runX86Test("RealDiv_Valid_4");
//	}
//
//	 @Test
//	public void RealNeg_Valid_1() {
//		runX86Test("RealNeg_Valid_1");
//	}
//
//	 @Test
//	public void RealSub_Valid_1() {
//		runX86Test("RealSub_Valid_1");
//	}
//
//	 @Test
//	public void RealSub_Valid_2() {
//		runX86Test("RealSub_Valid_2");
//	}
//
//	 @Test
//	public void Real_Valid_1() {
//		runX86Test("Real_Valid_1");
//	}
//
//	 @Test
//	public void RecordAccess_Valid_2() {
//		runX86Test("RecordAccess_Valid_2");
//	}
//
//	@Test
//	public void RecordAssign_Valid_1() {
//		runX86Test("RecordAssign_Valid_1");
//	}
//
//	@Test
//	public void RecordAssign_Valid_2() {
//		runX86Test("RecordAssign_Valid_2");
//	}
//
//	@Test
//	public void RecordAssign_Valid_3() {
//		runX86Test("RecordAssign_Valid_3");
//	}
//
//	@Test
//	public void RecordAssign_Valid_4() {
//		runX86Test("RecordAssign_Valid_4");
//	}
//
//	@Test
//	public void RecordAssign_Valid_5() {
//		runX86Test("RecordAssign_Valid_5");
//	}
//
//	 @Test
//	public void RecordAssign_Valid_6() {
//		runX86Test("RecordAssign_Valid_6");
//	}
//
//	@Test
//	public void RecordDefine_Valid_1() {
//		runX86Test("RecordDefine_Valid_1");
//	}
//
//	 @Test
//	public void String_Valid_1() {
//		runX86Test("String_Valid_1");
//	}
//
//	 @Test
//	public void String_Valid_2() {
//		runX86Test("String_Valid_2");
//	}
//
//	 @Test
//	public void String_Valid_3() {
//		runX86Test("String_Valid_3");
//	}
//
//	 @Test
//	public void String_Valid_4() {
//		runX86Test("String_Valid_4");
//	}
}
