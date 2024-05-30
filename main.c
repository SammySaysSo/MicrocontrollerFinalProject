 #define F_CPU (3300000UL)  //purpose is for the delay usage(gotten from professor in class)
 
 #include <util/delay.h>	//package just for the delay usage on the LCD scrolling

void LCD_Init(void);			//external Assembly functions
void UART_Init(void);
void UART_Clear(void);
void UART_Get(void);
void UART_Put(void);
void LCD_Write_Data(void);
void LCD_Write_Command(void);
void LCD_Read_Data(void);
void Mega328P_Init(void);
void UART_Get(void);
void ADC_Get(void);

unsigned char ASCII;			//shared I/O variable with Assembly
unsigned char DATA;				//shared internal variable with Assembly
char HADC;						
char LADC;

void UART_Puts(const char *str)	//Display a string in the PC Terminal Program
{
	while (*str)
	{
		ASCII = *str++;
		UART_Put();
	}
}

void LCD_Puts(const char *str)	//Display a string on the LCD Module
{
	while (*str)
	{
		DATA = *str++;
		LCD_Write_Data();
	}
}

void LCD(void)						//Lite LCD demo
{
	DATA = 0x34;					//first call: 0x34: 00110100: LCDDatasheet: function set(DL: 8 bit bus mode with MPU & N: 0 thus 1-line display mode & F: 1 thus 5x11 dots format display mode)
	LCD_Write_Command();
	DATA = 0x08;					//second call: 0x08: 00001000: LCDDatasheet: Display on and off(display off & cursor off & blink is off)
	LCD_Write_Command();
	DATA = 0x02;					//third call: 0x02: 00000010: LCDDatasheet: return home(Set DDRAM address to "00H" from AC and return cursor to its original position if shifted - contents of DDRAM are not changed)
	LCD_Write_Command();
	DATA = 0x06;					//fourth call: 0x06: 00000110: LCDDatasheet: entry mode set: shift right & cursor/blink moves to the right & DDRAM address increments by one(sets cursor move direction & specifies display shift - this is during W & R)
	LCD_Write_Command();
	DATA = 0x0f;					//fifth call: 0x0f: 00001111: LCDDatasheet: Display on and off(entire display on & cursor on & cursor position on)
	LCD_Write_Command();
	LCD_Puts("DETECTED DETECTED DETECTED DETECTED DETECTED");
}

void Command(void)					//command interpreter
{	
	ADC_Get();
	DATA = 0x1C;	
	float A2DValue = (((float)HADC) * 0x100 + (float)(LADC));	
	if(A2DValue > 500){
		UART_Puts("\r\bNOTHING!\r\b");
	}else{
		UART_Puts("\r\bDETECTED\r\b");
		LCD_Write_Command();
	}
	_delay_ms(500);
}
int main(void)
{
	Mega328P_Init();
	UART_Puts("\r\nInitializing Board, LCD, and Tracker...\r\n");
	LCD();
	while (1)
	{
		Command();				//infinite command loop
	}
}
