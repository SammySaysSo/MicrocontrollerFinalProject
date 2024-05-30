.section ".data"					//assembler directive - assembles following code in a section named ".data"
.equ	DDRB,0x04					//0x04 is offset(bc addressing as I/O register) - DDRB - Port B Data Direction Register - Bit 7-0 respectively: DDRB7/DDRB6/DDRB5/DDRB4/DDRB3/DDRB2/DDRB1/DDRB0 - reset: 0x00
										//Bit 0-7: DDRB: Port B Data Direction: selects data direction for individual pins in the Port - more information found in ATmega328PB_complete.pdf
.equ	DDRD,0x0A					//0x0A is offset(bc addressing as I/O register) - DDRD - Port D Data Direction Register - Bit 7-0 respectively: DDRD7/DDRD6/DDRD5/DDRD4/DDRD3/DDRD2/DDRD1/DDRD0 - reset: 0x00
										//Bit 0-7: DDRD: Port D Data Direction: selects data direction for individual pins in the Port - more information found in ATmega328PB_complete.pdf
.equ	PORTB,0x05					//0x05 is offset(bc addressing as I/O register) - PORTB - Port B Data Register - Bit 7-0 respectively: PORTBn/PORTBn/PORTBn/PORTBn/PORTBn/PORTBn/PORTBn/PORTBn - reset: 0x00
.equ	PORTD,0x0B					//0x0B is offset(bc addressing as I/O register) - PORTD - Port D Data Register - Bit 7-0 respectively: PORTDn/PORTDn/PORTDn/PORTDn/PORTDn/PORTDn/PORTDn/PORTDn - reset: 0x00
.equ	U2X0,1						//Bit 1 in UCSR0A register - U2X - Double the USART Transmission speed
										//This bit only has effect for the asynchronous operation. Write this bit to zero when using synchronous operation. This bit is reserved in Master SPI Mode(MSPIM)
										//Writing this bit to one will reduce the divisor of the baud rate divider from 16 to 8 effectively doubling the transfer rate for asynchronous communication
.equ	UBRR0L,0xC4					//0xC4 is offset - UBRR0L - USART Baud Rate n Register Low and High byte - The UBRRnL and UBRRnH register pair represents the 16-bit value, UBRRn (n=0,1)
.equ	UBRR0H,0xC5					//0xC5 is offset(+1 of low) - UBRR0H - offseet is to access high and low byte - 12-bit register which contains the USART baud rate. 
										//The UBRRnH contains the four most significant bits and the UBRRnL contains the eight least significant bits of the USART n baud rate
.equ	UCSR0A,0xC0					//0xC0 is offset - UCSR0A - USART Control and Status Register n A - Bit 7-0 respectively: RXC/TXC/UDRE/FE/DOR/UPE/U2X/MPCW - Reset: 0x20 - 20 in binary: 00100000
.equ	UCSR0B,0xC1					//0xC1 is offset - UCSR0B - USART Control and Status Register n B - Bit 7-0 respectively: RXCIE/TXCIE/UDRIE/RXEN/TXEN/UCSZ2/RXB8/TXB8 - Reset: 0x00
.equ	UCSR0C,0xC2					//0xC2 is offset - UCSR0C - USART Control and Status Register n C - Bit 7-0 respectively: UMSEL[1:0]/UPM[1:0]/USBS/UCSZ1 or UDORD/UCSZ0 or UCPHA/UCPOL - Reset: 0x06 - 6 in binary: 00000110
.equ	UDR0,0xC6					//0xC6 is offset - UDR0 - USART I/O Data Register n - Bit 8-0 respectively: TXB OR RXB[7:0] - Reset: 0x00
										//The Transmit Data Buffer Register (TXB) will be the destination for data written to the UDR1 Register location
										//Reading the UDRn Register location will return the contents of the Receive Data Buffer Register (RXB)
										//more info can be found in complete manuel: UDRE flag must be set in UCSRnA register(otherwise data will not be written ~ ie: ignored by USART Transmitter n)
.equ	RXC0,0x07					//Bit 7 in USCR0A register - RXC: USART Receive Complete
										//This flag bit is set when there are unread data in the receive buffer and cleared when the receive buffer is empty (i.e., does not contain any unread data).
.equ	UDRE0,0x05					//Bit 5 in USCR0A register - UDRE: USASRT Data Register Empty
										//The UDRE Flag indicates if the transmit buffer (UDRn) is ready to receive new data. If UDRE is one, the buffer is empty, and therefore ready to be written
										// UDRE is set after a reset to indicate that the Transmitter is ready.
.equ	ADCSRA,0x7A					//0x7A is offset - ADCSRA - ADC Control and Status Register A - Bit 7-0 respectively: ADEN/ADSC/ADATE/ADIF/ADIE/ADPSn/ADPSn/ADPSn - Reset: 0x00 
.equ	ADMUX,0x7C					//0x7C is offset - ADMUX - ADC Multiplexer Selection Register - Bit 7-0 respectively: REFSn/REFSn/ADLAR/''/MUXn/MUXn/MUXn/MUXn - Reset: 0x00 
.equ	ADCSRB,0x7B
.equ	DIDR0,0x7E					//0x7E is offset - DIDR0 - Digital Input Disable Register 0 - Bit 7-0 respectively: ADC7D/ADC6D/ADC5D/ADC4D/ADC3D/ADC2D/ADC1D/ADC0D - Reset: 0x00
										//Bit 0-7: ADC Digital Input Disable
.equ	DIDR1,0x7F					//0x7F is offset - DIDR1 - Digital Input Disable Register 1 - Bit 7-0 respectively: ''/''/''/''/''/''/AIN1D/AIN0D - Reset: 0x00
										//Bit 0-1: AIN Digital Input Disable - When this bit is written logic one, the digital input buffer on the AIN1/0 pin is disabled. The corresponding PIN Register bit will always read as zero when this bit is set
.equ	ADSC,6						//Bit 6 in ADCSRA register - ADSC: ADC Start Conversion
										//single vs free running mode conversion - ADC has to be enabled? - This first conversion performs initialization of the ADC
										//ADSC will read as one as long as a conversion is in progress. When the conversion is complete, it returns to zero. Writing zero to this bit has no effect
.equ	ADIF,4						//Bit 4 in ADCSRA register - ADIF: ADC Interrupt IN
										//This bit is set when an ADC conversion completes and the Data Registers are updated. - interrupt executd if ADIE bit is set & I-bit in SREG is set
										//ADIF is cleared by writing a logical one to the flag.
.equ	ADCL,0x78					//0x78 is offset - ADCL - ADC Data Register Low Byte(ADLAR=0) - Bit 7-0 respectively: ADC7/ADC6/ADC5/ADC4/ADC3/ADC2/ADC1/ADC0 - Reset: 0x00
										//The low byte [7:0] is accessible at the original offset. ADCL must be read first then ADCH. ADLAR & MUXn bits in ADMUX affects way read: if ADLAR is set(=1) then left adjusted. 
											//If ADLAR is cleared(=0) then righ adjusted)
.equ	ADCH,0x79

.global ASCII				//global variable to be used between Assembler1.s file and the main.c file - shared I/O variable
.global DATA				//shared internal variable with C <-- used in LCD methods


.section ".text"			//assembles following code in a section named ".text" - all of this is just initalizing registers as stated above
.global Mega328P_Init		//overall: everything is 8 bit bc of our device, baud rate: A higher baud rate = faster transmission of signals, bit rate = number of bits per second that the user can push through the transmission system.
Mega328P_Init:
		ldi	r16,0x07		;PB0(R*W),PB1(RS),PB2(E) as fixed outputs
		out	DDRB,r16		//OUT instruction: Store register to I/O Location - Stores data from register r in the register file to I/O Space(Ports/Timers/Config registers/etc)
								//write 0x07 into DDRB(Port B Data Direction Register), 7 in binary: 00000111 - DDRB0-DDRB2 is 1 while rest are 0 
		ldi	r16,0			//setting register 16 to 0
		out	PORTB,r16		//writes 0 into PORTB - all bits in PORTB are 0
		out	U2X0,r16		;initialize UART, 8bits, no parity, 1 stop, 9600
		ldi	r17,0x0			//setting register 17 to 0 - r17 going into the high byte,  change baute rate from the values of r17 and r16
		ldi	r16,0x67		//setting register 16 to 67 - r16 is going into the low byte of the baute rate register, 67 in decimal: 103 - 67 in binary: 01100111
		sts	UBRR0H,r17		//storing value of register 17 into UBRR0H(the address) in the data space - configure volt rate - 9600 BAUD rate - which is very common - see complete data sheet in USART in clock generation
		sts	UBRR0L,r16		//storing value of register 16 into UBRR0L(the address) in the data space - fosc is the clock rate(16 mega hrtz) - can find it in the fuses(when board is attached) - to then calculate UBRR
		ldi	r16,24			//setting register 16 to 24 - 24 in binary: 00011000 - the 24 value is for the 8 bits respectively(keeping first 3 as zero)(enable bit 4 & bit 3)(bit 2 zero)(bit 1 & 0 are zero bc only doing 8 bit bc device)
		sts	UCSR0B,r16		//storing value of register 16 into UCSR0B(the address) in the data space - UCSR0B: only enables bit 4 & 3: RXEN(Receive enable) & TXEN(transmitter enable) are 1 while rest are 0
		ldi	r16,6			//setting register 16 to 6 - 6 in binary: 00000110 - bit one and bit 2 enabled(1) while other are not(0): for demo: 00001110
		sts	UCSR0C,r16		//storing value of register 16 into UCSR0C(the address) in the data space - UCSR0C - 8 bits - using asynchronous usart - find in complete atmega - bit 7 and bit 6 zero for asynchrounous - character size setting(8bit)
								//since UMSEL[1:0](bit 7 & 6) are 0 thddrben asynchronous USART, since UPM[1:0](bit 5 & 4) are 0 then paritymode is disabled, USBS(bit 3) is 0 then stop bit is 1 bit
								//since UCSZ1[2:0](bit 2 & 1 ~ ignore UCSR1B.UCSZ12 bit) then character size is 011 which is 8-bit, since UCPOL(bit 0) is 0(bc asynchronous) means trasmitted data(output TxDn pin) is rising XCKn Edge while Received data(input RxDn pin) is falling XCKn Edge
		ldi r16,0x87		//initialize ADC - sets register 16 as 0x87 - 87 in decimal: 135, 87 in binary: 10000111
		sts	ADCSRA,r16		//storing value of register 16 into ADCSRA(the address ~ ADC Control and Status Register A) in the data space - ADEN & ADPSn & ADPSn & ADPSn set to 1 => 
								//ADEN enables ADC while the three ADPSn is 111 for a division factor of 128 between the system clock frequency and input clock to the ADC
		ldi r16,0x40		//sets register 16 to 0x40 - 40 in decimal: 64, 40 in binary: 01000000
		sts ADMUX,r16		//storing value of register 16 into ADMUX(the address) in the data space: REFSn(reference selection) only enabled(selects the voltage reference for the ADC) / 
								//ADLAR is 0 so right adjusted / MUX[3:0] is 0 so 0000: analog channel selection of ADC0
		ldi r16,0			//setting register 16 to 0
		sts ADCSRB,r16
		ldi r16,0xFE		//setting register 16 to 0xFE, FE in decimal: 254, FE in binary: 11111110
		sts DIDR0,r16		//storing value of register 16 into DIDR0(the address ~ Digital Input Disable Register 0) in the data space: All bits except bit 0 is 1
								//When the respective bits are written to logic one, the digital input buffer on the corresponding ADC pin is disabled.
								//The corresponding PIN Register bit will always read as zero when this bit is set.
		ldi r16,0xFF		//setting register 16 to 0xFF, FF in decimal: 255, FE in binary: 11111111
		sts DIDR1,r16		//storing value of register 16 into DIDR0(the address ~ Digital Input Disable Register 1) in the data space: Bit 0 & 1 are 1: AIN1D & AIN0D: AIN Digital Input Disable - When this bit is written logic one, the digital input buffer on the AIN1/0 pin is disabled
								//The corresponding PIN Register bit will always read as zero when this bit is set
		ret					//end function and section of Mega328P_init

.global LCD_Write_Command
LCD_Write_Command:
	call	UART_Off		//call to a subroutine(UART_Off) with the entire program memory - turn off UART to prep the DDRD, -, PORTB, & LCD_Delay
	ldi		r16,0xFF		;PD0 - PD7 as outputs, 0xFF in decimal: 255, in binary: 11111111
	out		DDRD,r16		//OUT instruction: Store register to I/O Location - Stores data from register r in the register file to I/O Space(Ports/Timers/Config registers/etc) <-- stores register 16 data into DDRD
								//DDRD - Port D Data Direction Register - Bit 0-7: selects data direction for individual pins in the Port - more information found in ATmega328PB_complete.pdf
	lds		r16,DATA		//loading from data memory of address of DATA(global char variable) into register 16
								//first call: 0x34: 00110100: LCDDatasheet: function set(DL: 8 bit bus mode with MPU & N: 0 thus 1-line display mode & F: 1 thus 5x11 dots format display mode)
								//second call: 0x08: 00001000: LCDDatasheet: Display on and off(display off & cursror off & blink is off)
								//third call: 0x02: 00000010: LCDDatasheet: return home(Set DDRAM address to "00H" from AC and return cursor to its original positio if shifted - contents of DDRAM are not changed)
								//fourth call: 0x06: 00000110: LCDDatasheet: entry mode set: shift right & cursor/blink moves to the right & DDRAM address increments by one(sets cursor move direction & specifies display shift - this is during W & R)
								//fifth call: 0x0f: 00001111: LCDDatasheet: Display on and off(entire display on & cursor on & cursor position on)
	out		PORTD,r16		//storing register 16(DATA) data into PORTD: Port D Data Register: Bits 7:0 Port D Data<-- ports are for data output
								//first call: PORTB2 & PORTB4 & PORTB5 set
								//second call: PORTB3 set
								//third call: PORTB1 set
								//fourth call: PORTB1 & PORTB2 set
								//fifth call: PORTB1 & PORTB2 & PORTB3 & PORTB4 set
	ldi		r16,4			//setting register 16 to 4 - 4 in binary: 100 <-- this 4 value is a decimal right?
	out		PORTB,r16		//storing register 16(4) data into PORTB:Port B Data Register: Bits 7:0 Port D Data: only bit set is PORTB2
	call	LCD_Delay		//call to a subroutine(LCD_Delay) with the entire program memory - LCD_Delay to give time to the previous operations to complete(bc it is "slow" compared to other operations)
	ldi		r16,0			//setting register 16 to 0
	out		PORTB,r16		//storing register 16(4) data into PORTB:Port B Data Register: Bits 7:0 Port D Data: no bits are set -- meaning no data are in the ports
	call	LCD_Delay		//call to a subroutine(LCD_Delay) with the entire program memory - LCD_Delay to give time to the previous operations to complete(bc it is "slow" compared to other operations)
	call	UART_On			//call to a subroutine(UART_On) with the entire program memory <-- after every operation completed: DDRD direction for the PORTD(which was set from DATA which was set from the C code)
	ret						//end "function" of LCD_Write_Command

LCD_Delay:					//this function is just a delay by decreasing r16 by one and then set r17 back to 0xFF whenever r16 and r17 gets equal to eachother
	ldi		r16,0xFA		//setting register 16 to 0xFA, 0xFA in decimal: 250, in binary: 11111010
D0:	ldi		r17,0xFF		//setting register 16 to 0xFF, 0xFA in decimal: 255, in binary: 11111111
D1:	dec		r17				//decrement r17 by one
	brne	D1				//branch to D1 if not equal <-- if r17 isn't equal to r16
	dec		r16				//decrement r16 by one
	brne	D0				//branch to D1 if not equal <-- back to set r17 to 0xFF
	ret						//end "function" of LCD_Delay

.global LCD_Write_Data //only difference with this is that ldi is 6 instead of four
LCD_Write_Data:
	call	UART_Off		//call to a subroutine(UART_Off) with the entire program memory - turn off UART to prep the DDRD, PORTD, PORTB, & LCD_Delay
	ldi		r16,0xFF		;PD0 - PD7 as outputs, 0xFF in decimal: 255, in binary: 11111111
	out		DDRD,r16		//OUT instruction: Store register to I/O Location - Stores data from register r in the register file to I/O Space(Ports/Timers/Config registers/etc) <-- stores register 16 data into DDRD
								//DDRD - Port D Data Direction Register - Bit 0-7: selects data direction for individual pins in the Port - more information found in ATmega328PB_complete.pdf
	lds		r16,DATA		//loading from data memory of address of DATA(global char variable) into register 16
	out		PORTD,r16		//storing register 16(DATA) data into PORTD: Port D Data Register: Bits 7:0 Port D Data<-- ports are for data output
	ldi		r16,6			//setting register 16 to 6 - 6 in binary: 110 <-- this 6 value is a decimal right?
	out		PORTB,r16		//storing register 16(6) data into PORTB:Port B Data Register: Bits 7:0 Port D Data: only bit set is PORTB2 & PORTB1
	call	LCD_Delay		//call to a subroutine(LCD_Delay) with the entire program memory - LCD_Delay to give time to the previous operations to complete(bc it is "slow" compared to other operations)
	ldi		r16,0			//setting register 16 to 0
	out		PORTB,r16		//storing register 16(0) data into PORTB:Port B Data Register: Bits 7:0 Port D Data: no bits are set -- meaning no data are in the ports
	call	LCD_Delay		//call to a subroutine(LCD_Delay) with the entire program memory - LCD_Delay to give time to the previous operations to complete(bc it is "slow" compared to other operations)
	call	UART_On			//call to a subroutine(UART_On) with the entire program memory <-- after every operation completed: DDRD direction for the PORTD(which was set from DATA which was set from the C)
	ret						//end "function" of LCD_Write_Data

.global LCD_Read_Data
LCD_Read_Data:
	call	UART_Off		//call to a subroutine(UART_Off) with the entire program memory - turn off UART to prep the DDRD, PORTD & PORTB
	ldi		r16,0x00		//setting register 16 to 0
	out		DDRD,r16		//OUT instruction: Store register to I/O Location - Stores data from register r in the register file to I/O Space(Ports/Timers/Config registers/etc) <-- stores register 16 data into DDRD
								//DDRD - Port D Data Direction Register - Bit 0-7: selects data direction for individual pins in the Port - more information found in ATmega328PB_complete.pdf
	out		PORTB,4			//storing 4 data into PORTB: Port D Data Register: Bits 7:0 Port D Data<-- ports are for data output: only bit set is PORTB2
								//PORTB is the E & RW & RS relation on LCD module on the PB bits on the module
	in		r16,PORTD		//Read data from Data Register - IN: Load an I/O Location to Register - r16 reading from PORTD
								//PORTD relates to the LCD D0-D7 bits in the LCD <-- thus this commands is storing the data from PORTD into r16 to be read into DATA(to then be used for future c code)
	sts		DATA,r16		//storing value of register 16 into DATA(the global char variable) in the data space(purpose is to be used in whichever c code)
	out		PORTB,0			//storing 0 "data" into PORTB(E, RW, and RS on the LCD)
	call	UART_On			//call to a subroutine(UART_On) with the entire program memory <-- after every operation completed: after reading can turn it back on to continue the async and other necessary code related functions in c or assembly)
	ret						//end "function" of LCD_Read_Data

.global UART_On
UART_On:
	ldi		r16,2				//setting register 16 to 2 - 2 in binary: 10
	out		DDRD,r16			//OUT instruction: Store register to I/O Location - Stores data from register r in the register file to I/O Space(Ports/Timers/Config registers/etc)
									//DDRD - Port D Data Direction Register - Bit 0-7: selects data direction for individual pins in the Port - more information found in ATmega328PB_complete.pdf
									//this is related to PORTD: Data Direction Register that is used to configure the directions (either as input or output) of the IO lines of Port-D Register
											//microcontrollers (MCUs) control applications through their digital Input and Output (I/O) pins: pins can monitor any voltage present as a	input and supply or sink current as a high or low-voltage digital output <--PORTs
											//Ports are represented by registers inside the microcontroller, and allow the program (firmware) to control the state of the pins, or conversely, read the state of the pins if they are configured as inputs
	ldi		r16,24				//setting register 16 to 24 - 24 in binary: 11000 <-- this 24 is a decimal value right?
	sts		UCSR0B,r16			//storing value of register 16 into UCSR0B(the address) in the data space - bits set to r16 value
									//UCSR0B bits that are on: RXEN(Receiver Enable) enables UART Receiver( The Receiver will override normal port operation for the RxDn pin when enabled)
									//UCSR0B bits that are on: – TXEN:?Transmitter Enable Writing this bit to one enables the USART Transmitter. The Transmitter will override normal port operation for the TxDn pin when enabled)
	ret							//end "function" of UART_On

.global UART_Off
UART_Off:
	ldi	r16,0					//setting register 16 to 0(to be used in next instruction)
	sts UCSR0B,r16				//storing value of register 16 into UCSR0B(the address) in the data space - all bits get set to 0
									//ie: RXCIE:?RX Complete Interrupt Enabe isn't set, TXCIE:?TX Complete Interrupt Enable isn't set, UDRIE:?USART Data Register Empty Interrupt Enable isn't set
									//ie: RXEN:?Receiver Enable isn't set, TXEN:?Transmitter Enable isn't set(disabled), UCSZ2:?Character Size isn't set, RXB8:?Receive Data Bit 8 isn't set, & TXB8:?Transmit Data Bit 8 isn't set
	ret							//end "function" of UART_Off

.global UART_Clear
UART_Clear:
	lds		r16,UCSR0A			//loading from data memory of address of UCSR0A(USART Control and Status Register n A) into register 16
	sbrs	r16,RXC0			//checking specific bit - sbrs: skip if bit in register is set - if it isn't set then there is something in it ~ see notes above on what exactly RXC0 is
									//RXC:?USART Receive Complete: This flag bit is set when there are unread data in the receive buffer and cleared when the receive buffer is empty (ie: no unread data)
	ret							//end "function" of UART_Clear <-- this "UART_Clear" function will continue forever until the UCSR0A.RXC0 bit is empty <-- from the asynchronous UART
	lds		r16,UDR0			//loads value of global variable UDR0 into r16 - loading from data space(ie. SRAM.I/O register)(tansmitting data)
									//UDR0: USART Data Register or UDRn(it is the Transmit and Receiver Data buffer)(Bits 7:0 – TXB / RXB[7:0]:?USART Transmit / Receive Data Buffer)
	rjmp	UART_Clear			//end "function" of UART_Clear

.global UART_Put
UART_Put:
	lds		r17,UCSR0A			//loading from data memory of address of UCSR0A(USART Control and Status Register n A) into register 17
	sbrs	r17,UDRE0			//checking specific bit - sbrs: skip if bit in register is set - if it isn't set then there is something in it ~ see notes above on what exactly UDRE0 is
	rjmp	UART_Put			//relative jmp back to UART_Put to load UCSR0A again(this isn't a infite loop since this is asyncronous ~ UART UDR(USART I/O Data Register n) by Tx(Transmit Data Buffer Register ~ destination) ~ return contents of the Receive Data Buffer Register (RXB ~ content))
	lds		r16,ASCII			//loads value of global variable ASCII into r16 - loading from data space(ie. SRAM.I/O register)
	sts		UDR0,r16			//storing value of register 16 into UDR0(the address) in the data space
									//UDR0: USART Data Register or UDRn(it is the Transmit and Receiver Data buffer)(Bits 7:0 – TXB / RXB[7:0]:?USART Transmit / Receive Data Buffer)
	ret							//end "function" of UART_Put
	//UART just does changes UDR automatically(once trasmission is done)
.global UART_Get
UART_Get:
	lds		r16,UCSR0A			//loading from data memory of address of UCSR0A(USART Control and Status Register n A) into register 16
	sbrs	r16,RXC0			//checking specific bit - sbrs: skip if bit in register is set - if it isn't set then there is something in it ~ see notes above on what exactly RXC0 is
									//This flag bit is set when there are unread data in the receive buffer and cleared when the receive buffer is empty (ie: no unread data)
	rjmp	UART_Get			//relative jmp back to UART_GET to load UCSR0A again(this isn't a infite loop since this is asyncronous ~ UART UDR(USART I/O Data Register n) by Tx(Transmit Data Buffer Register ~ destination) ~ return contents of the Receive Data Buffer Register (RXB ~ content))
	lds		r16,UDR0			//loads value of global variable UDR0 into r16 - loading from data space(ie. SRAM.I/O register)(tansmitting data)
									//UDR0: USART Data Register or UDRn(it is the Transmit and Receiver Data buffer)(Bits 7:0 – TXB / RXB[7:0]:?USART Transmit / Receive Data Buffer)
	sts		ASCII,r16			//storing value of register 16 into ASCII(the address ~ the global variable) in the data space(ends the while loop in c)
	ret							//end "function" of UART_Get

.global ADC_Get
ADC_Get:
		ldi		r16,0xC7			//loads value of 0xC7 into register 16, C7 in decimal: 199, C7 in binary: 11000111
		sts		ADCSRA,r16			//storing value of register 16 into UDR0(the address) in the data space
										//ADCSRA: ADC Control and Status Register A: ADEN is set(enables ADC) & ADSC is set(starting conversion) & division factor is 128
A2V1:	lds		r16,ADCSRA			//loading from data memory of address of ADCSRA(ADC Control and Status Register A) into register 16
		sbrc	r16,ADSC			//Skip if Bit in Register is Cleared: skips next instruction if ADSC is cleared
										//ADSC: ?ADC Start Conversion: got set to one from previous instructions above
		rjmp 	A2V1				//jumps back to A2V1 to check ADCSRA(if ADC isn't ready to start conversion ~ ie: ADCSRA.ADSC is set to 0)
		lds		r16,ADCL			//loading from data memory of address of ADCL(ADC Data Register Low) into register 16
										//When an ADC conversion is complete, the result is found in these two registers(ADCL & ADCH)
		sts		LADC,r16			//storing value of register 16 into LADC(the global char variable) in the data space: LADC value is the low bits(0-7) conversion result of the ADC
		lds		r16,ADCH			//loading from data memory of address of ADHL(ADC Data Register High) into register 16
										//Bit 0-9 is ADC Conversion result
		sts		HADC,r16			//storing value of register 16 into HADC(the global char variable) in the data space: HADC value is the hih bits(8 & 9) conversion result of the ADC
		ret							//end "function" of UART_Get

	.end