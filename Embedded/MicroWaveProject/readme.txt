fpga_buzzer_driver.ko : Buzzer�� ���� ����̽� ����̹�
fpga_fnd_driver.ko : FND�� ���� ����̽� ����̹�
fpga_step_motor_driver.ko : Step Motor�� ���� ����̽� ����̹�
fpga_text_lcd_driver.ko : Text LCD�� ���� ����̽� ����̹�
moduleup : �� ����̽� ����̹��� �Ѳ����� ��� �����ϰ� ��ġ������ �����Ѵ�.

FpgaFndActivity.java : Application�� �����ڹ��ڵ��, �� ��ɰ� �̺�Ʈ ó���� �����Ѵ�.
main.xml : Application�� ȭ�鱸�� xml����

Android.mk : fpga-microwave-jni.c�ڵ��� Makefile. �������̺귯�� ������ �������ش�.
fpga-microwave-jni.c : FND, Buzzer, StepMotor, TextLCD 4���� ��ɿ� ���� ó���Լ��� ���ִ� jni�ڵ��̴�.
libfpga-microwave-jni.so : makefile�� ������ fpga-microwave-jni.c�� �������̺귯�� �����̴�.