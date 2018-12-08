fpga_buzzer_driver.ko : Buzzer에 대한 디바이스 드라이버
fpga_fnd_driver.ko : FND에 대한 디바이스 드라이버
fpga_step_motor_driver.ko : Step Motor에 대한 디바이스 드라이버
fpga_text_lcd_driver.ko : Text LCD에 대한 디바이스 드라이버
moduleup : 각 디바이스 드라이버를 한꺼번에 모듈 적재하고 장치파일을 생성한다.

FpgaFndActivity.java : Application의 메인자바코드로, 각 기능과 이벤트 처리를 진행한다.
main.xml : Application의 화면구성 xml파일

Android.mk : fpga-microwave-jni.c코드의 Makefile. 공유라이브러리 파일을 생성해준다.
fpga-microwave-jni.c : FND, Buzzer, StepMotor, TextLCD 4가지 기능에 관한 처리함수가 들어가있는 jni코드이다.
libfpga-microwave-jni.so : makefile로 생성된 fpga-microwave-jni.c의 공유라이브러리 파일이다.