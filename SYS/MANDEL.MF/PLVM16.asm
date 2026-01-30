2000- AD 98 BF  L2000      LDA   $BF98                          
2003- 29 30                AND   #$30                           
2005- C9 30                CMP   #$30                           
2007- F0 2A                BEQ   L2033                          
2009- A0 00                LDY   #$00                           
200B- B9 1C 20  L200B      LDA   L201C,Y                        
200E- F0 36                BEQ   L2046                          
2010- 09 80                ORA   #$80                           
2012- 20 ED FD             JSR   COUT                           
2015- C8                   INY                                  
2016- D0 F3                BNE   L200B                          
2018- A0 1C                LDY   #$1C                           
201A- D0 28                BNE   L2044                          
201C- 31 32     L201C      AND   ($32),Y                        
201E- 38                   SEC                                  
201F- 4B                   ???                                  
2020- 20 4D 45             JSR   $454D                          
2023- 4D 4F 52             EOR   $524F                          
2026- 59 20 52             EOR   $5220,Y                        
2029- 45 51                EOR   $51                            
202B- 55 49                EOR   $49,X                          
202D- 52 45                EOR   (A5H)                          
202F- 44 2E                ???   MASK                           
2031- 0D 00 18             ORA   $1800                          
2034- FB                   ???                                  
2035- B0 51                BCS   L2088                          
2037- A0 00                LDY   #$00                           
2039- B9 5B 20  L2039      LDA   L205B,Y                        
203C- F0 08                BEQ   L2046                          
203E- 09 80                ORA   #$80                           
2040- 20 ED FD             JSR   COUT                           
2043- C8                   INY                                  
2044- D0 F3     L2044      BNE   L2039                          
2046- AD 00 C0  L2046      LDA   KBD                            
2049- 10 EE                BPL   L2039                          
204B- AD 10 C0             LDA   KBDSTRB                        
204E- 20 00 BF             JSR   MLI                            
2051- 65 54                ADC   $54                            
2053- 20 04 04             JSR   $0404                          
2056- 00                   BRK                                  
2057- 00                   BRK                                  
2058- 00                   BRK                                  
2059- 00                   BRK                                  
205A- 00                   BRK                                  
205B- 36 35     L205B      ROL   $35,X                          
205D- 43                   ???                                  
205E- 38                   SEC                                  
205F- 30 32                BMI   L2093                          
2061- 2F 36                ???   L2099                          
2063- 35 43                AND   A4H,X                          
2065- 38                   SEC                                  
2066- 31 36                AND   (CSWL),Y                       
2068- 20 43 50             JSR   $5043                          
206B- 55 20                EOR   WNDLFT,X                       
206D- 52 45                EOR   (A5H)                          
206F- 51 55                EOR   ($55),Y                        
2071- 49 52                EOR   #$52                           
2073- 45 44                EOR   A5L                            
2075- 2E 0D 50             ROL   $500D                          
2078- 52 45                EOR   (A5H)                          
207A- 53                   ???                                  
207B- 53                   ???                                  
207C- 20 41 4E             JSR   $4E41                          
207F- 59 20 4B             EOR   $4B20,Y                        
2082- 45 59                EOR   $59                            
2084- 2E 2E 2E             ROL   $2E2E                          
2087- 00                   BRK                                  
2088- FB        L2088      ???                                  
2089- AD 98 BF             LDA   $BF98                          
208C- 29 30                AND   #$30                           
208E- C9 30                CMP   #$30                           
2090- D0 3B                BNE   L20CD                          
2092- AD 26 BF             LDA   $BF26                          
2095- CD 10 BF             CMP   $BF10                          
2098- D0 08                BNE   L20A2                          
209A- AD 27 BF             LDA   $BF27                          
209D- CD 11 BF             CMP   $BF11                          
20A0- F0 2B                BEQ   L20CD                          
20A2- AC 31 BF  L20A2      LDY   $BF31                          
20A5- B9 32 BF  L20A5      LDA   $BF32,Y                        
20A8- 29 F3                AND   #$F3                           
20AA- C9 B3                CMP   #$B3                           
20AC- F0 05                BEQ   L20B3                          
20AE- 88                   DEY                                  
20AF- 10 F4                BPL   L20A5                          
20B1- 30 1A                BMI   L20CD                          
20B3- B9 33 BF  L20B3      LDA   $BF33,Y                        
20B6- 99 32 BF             STA   $BF32,Y                        
20B9- F0 03                BEQ   L20BE                          
20BB- C8                   INY                                  
20BC- D0 F5                BNE   L20B3                          
20BE- AD 10 BF  L20BE      LDA   $BF10                          
20C1- 8D 26 BF             STA   $BF26                          
20C4- AD 11 BF             LDA   $BF11                          
20C7- 8D 27 BF             STA   $BF27                          
20CA- CE 31 BF             DEC   $BF31                          
20CD- 2C 83 C0  L20CD      BIT   PHASE1ON                       
20D0- 2C 83 C0             BIT   PHASE1ON                       
20D3- A9 53                LDA   #$53                           
20D5- 85 06                STA   $06                            
20D7- A9 21                LDA   #$21                           
20D9- 85 07                STA   $07                            
20DB- A0 00                LDY   #$00                           
20DD- 84 08                STY   $08                            
20DF- A9 D0                LDA   #$D0                           
20E1- 85 09                STA   $09                            
20E3- B1 06     L20E3      LDA   ($06),Y                        
20E5- 91 08                STA   ($08),Y                        
20E7- C8                   INY                                  
20E8- D0 F9                BNE   L20E3                          
20EA- E6 07                INC   $07                            
20EC- E6 09                INC   $09                            
20EE- A5 09                LDA   $09                            
20F0- C9 E0                CMP   #$E0                           
20F2- D0 EF                BNE   L20E3                          
20F4- B9 00 D1  L20F4      LDA   $D100,Y                        
20F7- 99 00 10             STA   $1000,Y                        
20FA- C8                   INY                                  
20FB- D0 F7                BNE   L20F4                          
20FD- 20 00 BF             JSR   MLI                            
2100- C7 50                ???   $50                            
2102- 21 AC                AND   ($AC,X)                        
2104- 00                   BRK                                  
2105- 03                   ???                                  
2106- A9 2F                LDA   #$2F                           
2108- D9 00 03             CMP   $0300,Y                        
210B- F0 04                BEQ   L2111                          
210D- C8                   INY                                  
210E- 99 00 03             STA   $0300,Y                        
2111- A9 43     L2111      LDA   #$43                           
2113- C8                   INY                                  
2114- 99 00 03             STA   $0300,Y                        
2117- A9 4D                LDA   #$4D                           
2119- C8                   INY                                  
211A- 99 00 03             STA   $0300,Y                        
211D- A9 44                LDA   #$44                           
211F- C8                   INY                                  
2120- 99 00 03             STA   $0300,Y                        
2123- A9 2E                LDA   #$2E                           
2125- C8                   INY                                  
2126- 99 00 03             STA   $0300,Y                        
2129- A9 31                LDA   #$31                           
212B- C8                   INY                                  
212C- 99 00 03             STA   $0300,Y                        
212F- A9 32                LDA   #$32                           
2131- C8                   INY                                  
2132- 99 00 03             STA   $0300,Y                        
2135- A9 38                LDA   #$38                           
2137- C8                   INY                                  
2138- 99 00 03             STA   $0300,Y                        
213B- 8C 00 03             STY   $0300                          
213E- 2C 83 C0             BIT   PHASE1ON                       
2141- 2C 83 C0             BIT   PHASE1ON                       
2144- B9 00 03  L2144      LDA   $0300,Y                        
2147- 99 EB D1             STA   $D1EB,Y                        
214A- 88                   DEY                                  
214B- 10 F7                BPL   L2144                          
214D- 4C 0C 10             JMP   $100C                          
2150- 01 00                ORA   ($00,X)                        
2152- 03                   ???                                  
2153- 9C D4 A2             STZ   $A2D4                          
2156- D4 A2                ???   $A2                            
2158- D4 A2                ???   $A2                            
215A- D4 A2                ???   $A2                            
215C- D4 A2                ???   $A2                            
215E- D4 A2                ???   $A2                            
2160- D4 A2                ???   $A2                            
2162- D4 A2                ???   $A2                            
2164- D4 A2                ???   $A2                            
2166- D4 A2                ???   $A2                            
2168- D4 A2                ???   $A2                            
216A- D4 A2                ???   $A2                            
216C- D4 A2                ???   $A2                            
216E- D4 A2                ???   $A2                            
2170- D4 A2                ???   $A2                            
2172- D4 96                ???   $96                            
2174- D4 CD                ???   $CD                            
2176- D8                   CLD                                  
2177- D5 D8                CMP   $D8,X                          
2179- BC D4 90             LDY   $90D4,X                        
217C- D5 A8                CMP   $A8,X                          
217E- D4 C9                ???   $C9                            
2180- D4 D1                ???   $D1                            
2182- D4 EF                ???   $EF                            
2184- 00                   BRK                                  
2185- 97 D7                ???   $D7                            
2187- 54 D4                ???   $D4                            
2189- E6 D3                INC   $D3                            
218B- 5A                   PHY                                  
218C- D4 68                ???   $68                            
218E- D4 79                ???   $79                            
2190- D4 86                ???   $86                            
2192- D4 27                ???   GBASH                          
2194- D8                   CLD                                  
2195- 34 D8                BIT   $D8,X                          
2197- 53                   ???                                  
2198- D8                   CLD                                  
2199- 6F D8                ???   L2173                          
219B- 41 D8                EOR   ($D8,X)                        
219D- 61 D8                ADC   ($D8,X)                        
219F- EA                   NOP                                  
21A0- D8                   CLD                                  
21A1- E0 D8                CPX   #$D8                           
21A3- ED D8 81             SBC   $81D8                          
21A6- D8                   CLD                                  
21A7- 4A                   LSR                                  
21A8- D9 47 D9             CMP   $D947,Y                        
21AB- 84 DA                STY   $DA                            
21AD- B6 DA                LDX   $DA,Y                          
21AF- CC DA B2             CPY   $B2DA                          
21B2- D4 46                ???   $46                            
21B4- D5 56                CMP   $56,X                          
21B6- D5 9F                CMP   $9F,X                          
21B8- D5 AE                CMP   $AE,X                          
21BA- D5 89                CMP   $89,X                          
21BC- D6 9A                DEC   $9A,X                          
21BE- D6 BE                DEC   $BE,X                          
21C0- D7 D4                ???   $D4                            
21C2- D7 7F                ???   $7F                            
21C4- D7 8F                ???   $8F                            
21C6- D7 9B                ???   $9B                            
21C8- D7 AD                ???   $AD                            
21CA- D7 E1                ???   $E1                            
21CC- D7 F3                ???   $F3                            
21CE- D7 04                ???   $04                            
21D0- D8                   CLD                                  
21D1- 1A                   INC                                  
21D2- D8                   CLD                                  
21D3- 93                   ???                                  
21D4- D4 27                ???   GBASH                          
21D6- D3                   ???                                  
21D7- 30 D3                BMI   L21AC                          
21D9- 44 D3     L21D9      ???   $D3                            
21DB- CA                   DEX                                  
21DC- D3                   ???                                  
21DD- D9 D3 0B             CMP   $0BD3,Y                        
21E0- D4 11                ???   $11                            
21E2- D4 02                ???   $02                            
21E4- D4 17                ???   $17                            
21E6- D4 1F                ???   $1F                            
21E8- D4 27                ???   GBASH                          
21EA- D4 2F                ???   $2F                            
21EC- D4 37                ???   CSWH                           
21EE- D4 44                ???   A5L                            
21F0- D4 3A                ???   PCL                            
21F2- D3                   ???                                  
21F3- FB                   ???                                  
21F4- D8                   CLD                                  
21F5- 06 D9                ASL   $D9                            
21F7- 23                   ???                                  
21F8- D9 3F D9             CMP   $D93F,Y                        
21FB- 15 D9                ORA   $D9,X                          
21FD- 35 D9                AND   $D9,X                          
21FF- BF D8                ???   L21D9                          
2201- C6 D8                DEC   $D8                            
2203- E1 D5                SBC   ($D5,X)                        
2205- 0D D6 CF             ORA   $CFD6                          
2208- D6 FF                DEC   $FF,X                          
220A- D6 33                DEC   $33,X                          
220C- D6 61                DEC   $61,X                          
220E- D6 25                DEC   CV,X                           
2210- D7 57                ???   $57                            
2212- D7 0A                ???   $0A                            
2214- DB 15 DB             ???   $DB15,Y                        
2217- 22 DB                ???   $DB                            
2219- 08                   PHP                                  
221A- 68                   PLA                                  
221B- 85 E9                STA   $E9                            
221D- 78                   SEI                                  
221E- 18                   CLC                                  
221F- FB                   ???                                  
2220- C2 20                ???   WNDLFT                         
2222- 68                   PLA                                  
2223- 1A                   INC                                  
2224- 85 F2                STA   $F2                            
2226- 86 E5                STX   $E5                            
2228- BA                   TSX                                  
2229- 86 EA                STX   $EA                            
222B- A2 20                LDX   #$20                           
222D- E4 E5                CPX   $E5                            
222F- F0 0B                BEQ   L223C                          
2231- CA        L2231      DEX                                  
2232- B4 A0                LDY   $A0,X                          
2234- 5A                   PHY                                  
2235- B4 C0                LDY   $C0,X                          
2237- 5A                   PHY                                  
2238- E4 E5                CPX   $E5                            
223A- D0 F5                BNE   L2231                          
223C- A2 D0     L223C      LDX   #$D0                           
223E- 86 F6                STX   $F6                            
2240- A0 00                LDY   #$00                           
2242- 4C F1 00             JMP   $00F1                          
2245- EA                   NOP                                  
2246- EA                   NOP                                  
2247- EA                   NOP                                  
2248- EA                   NOP                                  
2249- EA                   NOP                                  
224A- EA                   NOP                                  
224B- EA                   NOP                                  
224C- EA                   NOP                                  
224D- EA                   NOP                                  
224E- EA                   NOP                                  
224F- EA                   NOP                                  
2250- EA                   NOP                                  
2251- EA                   NOP                                  
2252- EA                   NOP                                  
2253- AC EB 10             LDY   $10EB                          
2256- B9 EB 10  L2256      LDA   $10EB,Y                        
2259- 99 00 03             STA   $0300,Y                        
225C- 88                   DEY                                  
225D- 10 F7                BPL   L2256                          
225F- 2C 82 C0             BIT   PHASE1OFF                      
2262- A0 04                LDY   #$04                           
2264- B9 BB 10  L2264      LDA   $10BB,Y                        
2267- 09 80                ORA   #$80                           
2269- 20 ED FD             JSR   COUT                           
226C- B9 C0 10             LDA   $10C0,Y                        
226F- 99 F0 02             STA   $02F0,Y                        
2272- 88                   DEY                                  
2273- 10 EF                BPL   L2264                          
2275- 2C 54 C0             BIT   PAGE2CLR                       
2278- 2C 51 C0             BIT   TXTSET                         
227B- 2C 5F C0             BIT   CLRAN3                         
227E- 20 58 FC             JSR   HOME                           
2281- A0 0F                LDY   #$0F                           
2283- B9 D1 10  L2283      LDA   $10D1,Y                        
2286- 99 EF 00             STA   $00EF,Y                        
2289- 88                   DEY                                  
228A- 10 F7                BPL   L2283                          
228C- A9 4C                LDA   #$4C                           
228E- 85 E6                STA   HPAG                           
2290- A0 12                LDY   #$12                           
2292- B9 D9 10  L2292      LDA   $10D9,Y                        
2295- 99 D0 03             STA   DOSWRM,Y                       
2298- 88                   DEY                                  
2299- 10 F7                BPL   L2292                          
229B- 20 00 BF             JSR   MLI                            
229E- CC B9 10             CPY   $10B9                          
22A1- D0 45                BNE   L22E8                          
22A3- 20 00 BF             JSR   MLI                            
22A6- C8                   INY                                  
22A7- AB                   ???                                  
22A8- 10 D0                BPL   L227A                          
22AA- 3D AD B0             AND   $B0AD,X                        
22AD- 10 8D                BPL   L223C                          
22AF- B2 10                LDA   ($10)                          
22B1- 20 00 BF             JSR   MLI                            
22B4- CA                   DEX                                  
22B5- B1 10                LDA   ($10),Y                        
22B7- D0 2F                BNE   L22E8                          
22B9- 20 00 BF             JSR   MLI                            
22BC- CC B9 10             CPY   $10B9                          
22BF- D0 27                BNE   L22E8                          
22C1- 9C FF 01             STZ   $01FF                          
22C4- 64 E2                STZ   YO                             
22C6- 64 E0                STZ   XO                             
22C8- A9 AF                LDA   #$AF                           
22CA- 85 E3                STA   $E3                            
22CC- 85 E1                STA   $E1                            
22CE- A2 FE                LDX   #$FE                           
22D0- 9A                   TXS                                  
22D1- E8                   INX                                  
22D2- 86 EB                STX   $EB                            
22D4- A2 20                LDX   #$20                           
22D6- 64 EC                STZ   $EC                            
22D8- 64 ED                STZ   $ED                            
22DA- 64 EE                STZ   $EE                            
22DC- AD 00 03             LDA   $0300                          
22DF- 38                   SEC                                  
22E0- E9 07                SBC   #$07                           
22E2- 8D 00 03             STA   $0300                          
22E5- 4C 00 20             JMP   L2000                          
22E8- EE F4 03  L22E8      INC   $03F4                          
22EB- A0 0B                LDY   #$0B                           
22ED- B9 C5 10  L22ED      LDA   $10C5,Y                        
22F0- 09 80                ORA   #$80                           
22F2- 20 ED FD             JSR   COUT                           
22F5- 88                   DEY                                  
22F6- 10 F5                BPL   L22ED                          
22F8- 20 0C FD             JSR   RDKEY                          
22FB- 6C FC FF             JMP   ($FFFC)                        
22FE- 03                   ???                                  
22FF- 00                   BRK                                  
2300- 03                   ???                                  
2301- 00                   BRK                                  
2302- 08                   PHP                                  
2303- 00                   BRK                                  
2304- 04 00                TSB   $00                            
2306- 00                   BRK                                  
2307- 20 00 9F             JSR   $9F00                          
230A- 00                   BRK                                  
230B- 00                   BRK                                  
230C- 01 00                ORA   ($00,X)                        
230E- 15 0D                ORA   $0D,X                          
2310- 31 1A                AND   ($1A),Y                        
2312- 0D CA C9             ORA   $C9CA                          
2315- D4 B1                ???   $B1                            
2317- 36 2E                ROL   MASK,X                         
2319- 44 4D                ???   $4D                            
231B- 43                   ???                                  
231C- 20 47 4E             JSR   $4E47                          
231F- 49 53                EOR   #$53                           
2321- 53                   ???                                  
2322- 49 4D                EOR   #$4D                           
2324- 68                   PLA                                  
2325- C8                   INY                                  
2326- BE FF FF             LDX   $FFFF,Y                        
2329- 7C 00 D0             JMP   ($D000,X)                      
232C- 2C 80 C0             BIT   PHASEOFF                       
232F- 4C C6 D0             JMP   $D0C6                          
2332- 2C 80 C0             BIT   PHASEOFF                       
2335- 4C F8 D2             JMP   $D2F8                          
2338- 2C 80 C0             BIT   PHASEOFF                       
233B- 4C C6 D2             JMP   $D2C6                          
233E- EA                   NOP                                  
233F- EA                   NOP                                  
2340- EA                   NOP                                  
2341- EA                   NOP                                  
2342- EA                   NOP                                  
2343- EA                   NOP                                  
2344- EA                   NOP                                  
2345- EA                   NOP                                  
2346- EA                   NOP                                  
2347- EA                   NOP                                  
2348- EA                   NOP                                  
2349- EA                   NOP                                  
234A- EA                   NOP                                  
234B- EA                   NOP                                  
234C- EA                   NOP                                  
234D- EA                   NOP                                  
234E- EA                   NOP                                  
234F- EA                   NOP                                  
2350- EA                   NOP                                  
2351- EA                   NOP                                  
2352- EA                   NOP                                  
2353- 9C D4 A2             STZ   $A2D4                          
2356- D4 A2                ???   $A2                            
2358- D4 A2                ???   $A2                            
235A- D4 A2                ???   $A2                            
235C- D4 A2                ???   $A2                            
235E- D4 A2                ???   $A2                            
2360- D4 A2                ???   $A2                            
2362- D4 A2                ???   $A2                            
2364- D4 A2                ???   $A2                            
2366- D4 A2                ???   $A2                            
2368- D4 A2                ???   $A2                            
236A- D4 A2                ???   $A2                            
236C- D4 A2                ???   $A2                            
236E- D4 A2                ???   $A2                            
2370- D4 A2                ???   $A2                            
2372- D4 96                ???   $96                            
2374- D4 CD                ???   $CD                            
2376- D8                   CLD                                  
2377- D5 D8                CMP   $D8,X                          
2379- BC D4 90             LDY   $90D4,X                        
237C- D5 A8                CMP   $A8,X                          
237E- D4 C9                ???   $C9                            
2380- D4 DE                ???   $DE                            
2382- D4 EF     L2382      ???   $EF                            
2384- 00                   BRK                                  
2385- 97 D7                ???   $D7                            
2387- 54 D4                ???   $D4                            
2389- E6 D3                INC   $D3                            
238B- 5A                   PHY                                  
238C- D4 68                ???   $68                            
238E- D4 79                ???   $79                            
2390- D4 86                ???   $86                            
2392- D4 27                ???   GBASH                          
2394- D8                   CLD                                  
2395- 34 D8                BIT   $D8,X                          
2397- 53                   ???                                  
2398- D8                   CLD                                  
2399- 6F D8                ???   L2373                          
239B- 41 D8                EOR   ($D8,X)                        
239D- 61 D8                ADC   ($D8,X)                        
239F- EA                   NOP                                  
23A0- D8                   CLD                                  
23A1- E0 D8                CPX   #$D8                           
23A3- ED D8 81             SBC   $81D8                          
23A6- D8                   CLD                                  
23A7- FF D9                ???   L2382                          
23A9- FC D9 84             ???   $84D9                          
23AC- DA        L23AC      PHX                                  
23AD- B6 DA                LDX   $DA,Y                          
23AF- CC DA B2             CPY   $B2DA                          
23B2- D4 61                ???   $61                            
23B4- D5 77                CMP   $77,X                          
23B6- D5 BA                CMP   $BA,X                          
23B8- D5 CF                CMP   $CF,X                          
23BA- D5 A6                CMP   $A6,X                          
23BC- D6 BD                DEC   $BD,X                          
23BE- D6 BE                DEC   $BE,X                          
23C0- D7 D4                ???   $D4                            
23C2- D7 7F                ???   $7F                            
23C4- D7 8F                ???   $8F                            
23C6- D7 9B                ???   $9B                            
23C8- D7 AD                ???   $AD                            
23CA- D7 E1                ???   $E1                            
23CC- D7 F3                ???   $F3                            
23CE- D7 04                ???   $04                            
23D0- D8                   CLD                                  
23D1- 1A                   INC                                  
23D2- D8                   CLD                                  
23D3- 93                   ???                                  
23D4- D4 27                ???   GBASH                          
23D6- D3                   ???                                  
23D7- 30 D3                BMI   L23AC                          
23D9- 44 D3     L23D9      ???   $D3                            
23DB- CA                   DEX                                  
23DC- D3                   ???                                  
23DD- D9 D3 0B             CMP   $0BD3,Y                        
23E0- D4 11                ???   $11                            
23E2- D4 02                ???   $02                            
23E4- D4 17                ???   $17                            
23E6- D4 1F                ???   $1F                            
23E8- D4 27                ???   GBASH                          
23EA- D4 2F                ???   $2F                            
23EC- D4 37                ???   CSWH                           
23EE- D4 44                ???   A5L                            
23F0- D4 3A                ???   PCL                            
23F2- D3                   ???                                  
23F3- FB                   ???                                  
23F4- D8                   CLD                                  
23F5- 06 D9                ASL   $D9                            
23F7- 23                   ???                                  
23F8- D9 3F D9             CMP   $D93F,Y                        
23FB- 15 D9                ORA   $D9,X                          
23FD- 35 D9                AND   $D9,X                          
23FF- BF D8                ???   L23D9                          
2401- C6 D8                DEC   $D8                            
2403- F4 D5                ???   $D5                            
2405- 1D D6 E4             ORA   $E4D6,X                        
2408- D6 0F                DEC   $0F,X                          
240A- D7 47                ???   $47                            
240C- D6 72                DEC   $72,X                          
240E- D6 3B                DEC   PCH,X                          
2410- D7 68                ???   $68                            
2412- D7 0A                ???   $0A                            
2414- DB 15 DB             ???   $DB15,Y                        
2417- 22 DB                ???   $DB                            
2419- 08                   PHP                                  
241A- 68                   PLA                                  
241B- 85 E9                STA   $E9                            
241D- 78                   SEI                                  
241E- 18                   CLC                                  
241F- FB                   ???                                  
2420- C2 20                ???   WNDLFT                         
2422- A0 01                LDY   #$01                           
2424- B3                   ???                                  
2425- 01 85                ORA   ($85,X)                        
2427- F2 68                SBC   ($68)                          
2429- 86 E5                STX   $E5                            
242B- BA                   TSX                                  
242C- 86 EA                STX   $EA                            
242E- A2 20                LDX   #$20                           
2430- E4 E5     L2430      CPX   $E5                            
2432- F0 0B                BEQ   L243F                          
2434- CA        L2434      DEX                                  
2435- B4 A0                LDY   $A0,X                          
2437- 5A                   PHY                                  
2438- B4 C0                LDY   $C0,X                          
243A- 5A                   PHY                                  
243B- E4 E5                CPX   $E5                            
243D- D0 F5                BNE   L2434                          
243F- 8E 03 C0  L243F      STX   SETRAMRD                       
2442- A2 D2                LDX   #$D2                           
2444- 86 F6                STX   $F6                            
2446- A0 00                LDY   #$00                           
2448- 4C F1 00             JMP   $00F1                          
244B- 08                   PHP                                  
244C- 68                   PLA                                  
244D- 85 E9                STA   $E9                            
244F- 78                   SEI                                  
2450- 18                   CLC                                  
2451- FB                   ???                                  
2452- A0 03                LDY   #$03                           
2454- B3                   ???                                  
2455- 01 3A                ORA   (PCL,X)                        
2457- 93                   ???                                  
2458- 01 D0                ORA   ($D0,X)                        
245A- C5 C2                CMP   $C2                            
245C- 20 AD E2             JSR   $E2AD                          
245F- 03                   ???                                  
2460- 85 E7                STA   $E7                            
2462- 68                   PLA                                  
2463- 3A                   DEC                                  
2464- 3A                   DEC                                  
2465- 48                   PHA                                  
2466- E2 20                ???   WNDLFT                         
2468- CA                   DEX                                  
2469- 95 C0                STA   $C0,X                          
246B- EB                   ???                                  
246C- 95 A0                STA   $A0,X                          
246E- 20 E6 00             JSR   HPAG                           
2471- 68                   PLA                                  
2472- 85 E7                STA   $E7                            
2474- 68                   PLA                                  
2475- 85 E8                STA   $E8                            
2477- 6C E7 00             JMP   ($00E7)                        
247A- 68                   PLA                                  
247B- 18                   CLC                                  
247C- 63                   ???                                  
247D- 01 83                ORA   ($83,X)                        
247F- 01 4C                ORA   ($4C,X)                        
2481- F0 00                BEQ   L2483                          
2483- A3        L2483      ???                                  
2484- 03                   ???                                  
2485- 38                   SEC                                  
2486- E3                   ???                                  
2487- 01 83                ORA   ($83,X)                        
2489- 03                   ???                                  
248A- 4C EF 00             JMP   $00EF                          
248D- 68                   PLA                                  
248E- 0A                   ASL                                  
248F- 18                   CLC                                  
2490- 63                   ???                                  
2491- 01 83                ORA   ($83,X)                        
2493- 01 4C                ORA   ($4C,X)                        
2495- F0 00                BEQ   L2497                          
2497- A2 10     L2497      LDX   #$10                           
2499- A3                   ???                                  
249A- 03                   ???                                  
249B- C3                   ???                                  
249C- 01 B0                ORA   ($B0,X)                        
249E- 21 0A                AND   ($0A,X)                        
24A0- B0 05                BCS   L24A7                          
24A2- CA                   DEX                                  
24A3- D0 FA                BNE   L249F                          
24A5- F0 14                BEQ   L24BB                          
24A7- 49 FF     L24A7      EOR   #$FF                           
24A9- FF 85                ???   L2430                          
24AB- E7 A3                ???   $A3                            
24AD- 01 CA                ORA   ($CA,X)                        
24AF- F0 0A                BEQ   L24BB                          
24B1- 0A        L24B1      ASL                                  
24B2- 06 E7                ASL   $E7                            
24B4- B0 02                BCS   L24B8                          
24B6- 63                   ???                                  
24B7- 01 CA                ORA   ($CA,X)                        
24B9- D0 F6                BNE   L24B1                          
24BB- 83        L24BB      ???                                  
24BC- 03                   ???                                  
24BD- 4C EF 00             JMP   $00EF                          
24C0- A3                   ???                                  
24C1- 01 0A                ORA   ($0A,X)                        
24C3- B0 05                BCS   L24CA                          
24C5- CA                   DEX                                  
24C6- D0 FA                BNE   L24C2                          
24C8- F0 F1                BEQ   L24BB                          
24CA- 49 FF     L24CA      EOR   #$FF                           
24CC- FF 85                ???   L2453                          
24CE- E7 A3                ???   $A3                            
24D0- 03                   ???                                  
24D1- CA                   DEX                                  
24D2- F0 E7                BEQ   L24BB                          
24D4- 0A        L24D4      ASL                                  
24D5- 06 E7                ASL   $E7                            
24D7- B0 02                BCS   L24DB                          
24D9- 63                   ???                                  
24DA- 03                   ???                                  
24DB- CA        L24DB      DEX                                  
24DC- D0 F6                BNE   L24D4                          
24DE- 83                   ???                                  
24DF- 03                   ???                                  
24E0- 4C EF 00             JMP   $00EF                          
24E3- 84 E4                STY   $E4                            
24E5- A0 11                LDY   #$11                           
24E7- A2 00                LDX   #$00                           
24E9- A3                   ???                                  
24EA- 05 10                ORA   $10                            
24EC- 06 A2                ASL   $A2                            
24EE- 81 49                STA   ($49,X)                        
24F0- FF FF                ???   L24F1                          
24F2- 1A                   INC                                  
24F3- 85 E7                STA   $E7                            
24F5- F0 23                BEQ   L251A                          
24F7- A3                   ???                                  
24F8- 03                   ???                                  
24F9- 10 07                BPL   L2502                          
24FB- E8                   INX                                  
24FC- 49 FF                EOR   #$FF                           
24FE- FF 1A                ???   L251A                          
2500- 83                   ???                                  
2501- 03                   ???                                  
2502- A5 E7     L2502      LDA   $E7                            
2504- 0A        L2504      ASL                                  
2505- 88                   DEY                                  
2506- 90 FC                BCC   L2504                          
2508- 85 E7                STA   $E7                            
250A- A9 00                LDA   #$00                           
250C- 00                   BRK                                  
250D- 2A        L250D      ROL                                  
250E- C3                   ???                                  
250F- 03                   ???                                  
2510- 90 03                BCC   L2515                          
2512- E3                   ???                                  
2513- 03                   ???                                  
2514- 38                   SEC                                  
2515- 26 E7     L2515      ROL   $E7                            
2517- 88                   DEY                                  
2518- D0 F3                BNE   L250D                          
251A- A4 E4     L251A      LDY   $E4                            
251C- 60                   RTS                                  
251D- 20 90 D3             JSR   $D390                          
2520- A5 E7                LDA   $E7                            
2522- 83                   ???                                  
2523- 03                   ???                                  
2524- 68                   PLA                                  
2525- 8A                   TXA                                  
2526- 4A                   LSR                                  
2527- B0 2C                BCS   L2555                          
2529- 4C F0 00             JMP   $00F0                          
252C- 20 90 D3             JSR   $D390                          
252F- 83                   ???                                  
2530- 03                   ???                                  
2531- 68                   PLA                                  
2532- E0 80                CPX   #$80                           
2534- B0 1F                BCS   L2555                          
2536- 4C F0 00             JMP   $00F0                          
2539- 20 90 D3             JSR   $D390                          
253C- E0 80                CPX   #$80                           
253E- 90 04                BCC   L2544                          
2540- 49 FF                EOR   #$FF                           
2542- FF 1A                ???   L255E                          
2544- 83        L2544      ???                                  
2545- 01 8A                ORA   ($8A,X)                        
2547- 4A                   LSR                                  
2548- A5 E7                LDA   $E7                            
254A- 90 04                BCC   L2550                          
254C- 49 FF                EOR   #$FF                           
254E- FF 1A                ???   L256A                          
2550- 83        L2550      ???                                  
2551- 03                   ???                                  
2552- 4C F0 00             JMP   $00F0                          
2555- 68        L2555      PLA                                  
2556- 49 FF                EOR   #$FF                           
2558- FF 1A                ???   L2574                          
255A- 48                   PHA                                  
255B- 4C F0 00             JMP   $00F0                          
255E- 68        L255E      PLA                                  
255F- 1A                   INC                                  
2560- 48                   PHA                                  
2561- 4C F0 00             JMP   $00F0                          
2564- 68                   PLA                                  
2565- 3A                   DEC                                  
2566- 48                   PHA                                  
2567- 4C F0 00             JMP   $00F0                          
256A- 68        L256A      PLA                                  
256B- 49 FF                EOR   #$FF                           
256D- FF 48                ???   L25B7                          
256F- 4C F0 00             JMP   $00F0                          
2572- 68                   PLA                                  
2573- 23                   ???                                  
2574- 01 83     L2574      ORA   ($83,X)                        
2576- 01 4C                ORA   ($4C,X)                        
2578- F0 00                BEQ   L257A                          
257A- 68        L257A      PLA                                  
257B- 03                   ???                                  
257C- 01 83                ORA   ($83,X)                        
257E- 01 4C                ORA   ($4C,X)                        
2580- F0 00                BEQ   L2582                          
2582- 68        L2582      PLA                                  
2583- 43                   ???                                  
2584- 01 83                ORA   ($83,X)                        
2586- 01 4C                ORA   ($4C,X)                        
2588- F0 00                BEQ   L258A                          
258A- 68        L258A      PLA                                  
258B- AA                   TAX                                  
258C- F0 06                BEQ   L2594                          
258E- 68                   PLA                                  
258F- 0A        L258F      ASL                                  
2590- CA                   DEX                                  
2591- D0 FC                BNE   L258F                          
2593- 48                   PHA                                  
2594- 4C F0 00  L2594      JMP   $00F0                          
2597- 68                   PLA                                  
2598- AA                   TAX                                  
2599- F0 09                BEQ   L25A4                          
259B- 68                   PLA                                  
259C- C9 00     L259C      CMP   #$00                           
259E- 80 6A                BRA   L260A                          
25A0- CA                   DEX                                  
25A1- D0 F9                BNE   L259C                          
25A3- 48                   PHA                                  
25A4- 4C F0 00  L25A4      JMP   $00F0                          
25A7- A3                   ???                                  
25A8- 01 48                ORA   ($48,X)                        
25AA- 4C F0 00             JMP   $00F0                          
25AD- C8                   INY                                  
25AE- B1 F2                LDA   ($F2),Y                        
25B0- 29 FF                AND   #$FF                           
25B2- 00                   BRK                                  
25B3- 18                   CLC                                  
25B4- 63                   ???                                  
25B5- 01 83                ORA   ($83,X)                        
25B7- 01 4C     L25B7      ORA   ($4C,X)                        
25B9- F0 00                BEQ   L25BB                          
25BB- C8        L25BB      INY                                  
25BC- B1 F2                LDA   ($F2),Y                        
25BE- 29 FF                AND   #$FF                           
25C0- 00                   BRK                                  
25C1- 49 FF                EOR   #$FF                           
25C3- FF 38                ???   L25FD                          
25C5- 63                   ???                                  
25C6- 01 83                ORA   ($83,X)                        
25C8- 01 4C                ORA   ($4C,X)                        
25CA- F0 00                BEQ   L25CC                          
25CC- C8        L25CC      INY                                  
25CD- B1 F2                LDA   ($F2),Y                        
25CF- 29 FF                AND   #$FF                           
25D1- 00                   BRK                                  
25D2- 23                   ???                                  
25D3- 01 83                ORA   ($83,X)                        
25D5- 01 4C                ORA   ($4C,X)                        
25D7- F0 00                BEQ   L25D9                          
25D9- C8        L25D9      INY                                  
25DA- B1 F2                LDA   ($F2),Y                        
25DC- 29 FF                AND   #$FF                           
25DE- 00                   BRK                                  
25DF- 03                   ???                                  
25E0- 01 83                ORA   ($83,X)                        
25E2- 01 4C                ORA   ($4C,X)                        
25E4- F0 00                BEQ   L25E6                          
25E6- 68        L25E6      PLA                                  
25E7- D0 06                BNE   L25EF                          
25E9- F4 FF                ???   $FF                            
25EB- FF 4C                ???   L2639                          
25ED- F0 00                BEQ   L25EF                          
25EF- F4 00     L25EF      ???   $00                            
25F1- 00                   BRK                                  
25F2- 4C F0 00             JMP   $00F0                          
25F5- 8A                   TXA                                  
25F6- 4A                   LSR                                  
25F7- 48                   PHA                                  
25F8- 4C F0 00             JMP   $00F0                          
25FB- C8                   INY                                  
25FC- B1 F2                LDA   ($F2),Y                        
25FE- 29 FF                AND   #$FF                           
2600- 00                   BRK                                  
2601- 48                   PHA                                  
2602- 4C F0 00             JMP   $00F0                          
2605- C8                   INY                                  
2606- B1 F2                LDA   ($F2),Y                        
2608- 09 00                ORA   #$00                           
260A- FF 48     L260A      ???   L2654                          
260C- 4C F0 00             JMP   $00F0                          
260F- C8                   INY                                  
2610- B1 F2                LDA   ($F2),Y                        
2612- 48                   PHA                                  
2613- C8                   INY                                  
2614- 30 03                BMI   L2619                          
2616- 4C F0 00             JMP   $00F0                          
2619- 4C B4 D8  L2619      JMP   $D8B4                          
261C- C8                   INY                                  
261D- B1 F2                LDA   ($F2),Y                        
261F- 48                   PHA                                  
2620- C8                   INY                                  
2621- 4C F0 00             JMP   $00F0                          
2624- 98                   TYA                                  
2625- 38                   SEC                                  
2626- 65 F2                ADC   $F2                            
2628- 85 F2                STA   $F2                            
262A- 48                   PHA                                  
262B- B2 F2                LDA   ($F2)                          
262D- A8                   TAY                                  
262E- 4C F0 00             JMP   $00F0                          
2631- 98                   TYA                                  
2632- 38                   SEC                                  
2633- 65 F2                ADC   $F2                            
2635- 85 F2                STA   $F2                            
2637- A5 E2                LDA   YO                             
2639- 85 E7     L2639      STA   $E7                            
263B- C5 E0                CMP   XO                             
263D- B0 38                BCS   L2677                          
263F- E2 20                ???   WNDLFT                         
2641- 8E 02 C0             STX   CLRRAMRD                       
2644- B2 E7                LDA   ($E7)                          
2646- 8E 03 C0             STX   SETRAMRD                       
2649- D2 F2                CMP   ($F2)                          
264B- D0 20                BNE   L266D                          
264D- A8                   TAY                                  
264E- 8E 02 C0  L264E      STX   CLRRAMRD                       
2651- B1 E7                LDA   ($E7),Y                        
2653- 8E 03 C0             STX   SETRAMRD                       
2656- D1 F2                CMP   ($F2),Y                        
2658- D0 0B                BNE   L2665                          
265A- 88                   DEY                                  
265B- D0 F1                BNE   L264E                          
265D- A5 E8                LDA   $E8                            
265F- 48                   PHA                                  
2660- A5 E7                LDA   $E7                            
2662- 48                   PHA                                  
2663- 80 2C                BRA   L2691                          
2665- 8E 02 C0  L2665      STX   CLRRAMRD                       
2668- B2 E7                LDA   ($E7)                          
266A- 8E 03 C0             STX   SETRAMRD                       
266D- C2 20     L266D      ???   WNDLFT                         
266F- 29 FF                AND   #$FF                           
2671- 00                   BRK                                  
2672- 38                   SEC                                  
2673- 65 E7                ADC   $E7                            
2675- 80 C2                BRA   L2639                          
2677- B2 F2     L2677      LDA   ($F2)                          
2679- A8                   TAY                                  
267A- 29 FF                AND   #$FF                           
267C- 00                   BRK                                  
267D- 49 FF                EOR   #$FF                           
267F- FF 18                ???   L2699                          
2681- 65 E2                ADC   YO                             
2683- 85 E2                STA   YO                             
2685- 48                   PHA                                  
2686- E2 20                ???   WNDLFT                         
2688- B1 F2     L2688      LDA   ($F2),Y                        
268A- 91 E2                STA   (YO),Y                         
268C- 88                   DEY                                  
268D- C0 FF                CPY   #$FF                           
268F- D0 F7                BNE   L2688                          
2691- B2 F2     L2691      LDA   ($F2)                          
2693- A8                   TAY                                  
2694- C2 20                ???   WNDLFT                         
2696- 4C F0 00             JMP   $00F0                          
2699- BB        L2699      ???                                  
269A- A0 00                LDY   #$00                           
269C- 98                   TYA                                  
269D- E2 20                ???   WNDLFT                         
269F- B3                   ???                                  
26A0- 01 C2                ORA   ($C2,X)                        
26A2- 20 83 01             JSR   $0183                          
26A5- 9B                   ???                                  
26A6- 4C F0 00             JMP   $00F0                          
26A9- BB                   ???                                  
26AA- A0 00                LDY   #$00                           
26AC- B3                   ???                                  
26AD- 01 83                ORA   ($83,X)                        
26AF- 01 9B                ORA   ($9B,X)                        
26B1- 4C F0 00             JMP   $00F0                          
26B4- BB                   ???                                  
26B5- A0 00                LDY   #$00                           
26B7- 98                   TYA                                  
26B8- 8E 02 C0             STX   CLRRAMRD                       
26BB- E2 20                ???   WNDLFT                         
26BD- B3                   ???                                  
26BE- 01 C2                ORA   ($C2,X)                        
26C0- 20 8E 03             JSR   $038E                          
26C3- C0 83                CPY   #$83                           
26C5- 01 9B                ORA   ($9B,X)                        
26C7- 4C F0 00             JMP   $00F0                          
26CA- BB                   ???                                  
26CB- A0 00                LDY   #$00                           
26CD- 8E 02 C0             STX   CLRRAMRD                       
26D0- B3                   ???                                  
26D1- 01 8E                ORA   ($8E,X)                        
26D3- 03                   ???                                  
26D4- C0 83                CPY   #$83                           
26D6- 01 9B                ORA   ($9B,X)                        
26D8- 4C F0 00             JMP   $00F0                          
26DB- 98        L26DB      TYA                                  
26DC- 18                   CLC                                  
26DD- 65 F2                ADC   $F2                            
26DF- 85 F2                STA   $F2                            
26E1- A0 FF                LDY   #$FF                           
26E3- C8                   INY                                  
26E4- 30 F5                BMI   L26DB                          
26E6- B1 F2                LDA   ($F2),Y                        
26E8- 29 FF                AND   #$FF                           
26EA- 00                   BRK                                  
26EB- 18                   CLC                                  
26EC- 65 E0                ADC   XO                             
26EE- 48                   PHA                                  
26EF- 4C F0 00             JMP   $00F0                          
26F2- C8                   INY                                  
26F3- BB                   ???                                  
26F4- B1 F2                LDA   ($F2),Y                        
26F6- A8                   TAY                                  
26F7- B1 E0                LDA   (XO),Y                         
26F9- 29 FF                AND   #$FF                           
26FB- 00                   BRK                                  
26FC- 48                   PHA                                  
26FD- 9B                   ???                                  
26FE- 4C F0 00             JMP   $00F0                          
2701- C8                   INY                                  
2702- BB                   ???                                  
2703- B1 F2                LDA   ($F2),Y                        
2705- A8                   TAY                                  
2706- B1 E0                LDA   (XO),Y                         
2708- 48                   PHA                                  
2709- 9B                   ???                                  
270A- 4C F0 00             JMP   $00F0                          
270D- C8                   INY                                  
270E- BB                   ???                                  
270F- B1 F2                LDA   ($F2),Y                        
2711- A8                   TAY                                  
2712- 8E 02 C0             STX   CLRRAMRD                       
2715- B1 E0                LDA   (XO),Y                         
2717- 8E 03 C0             STX   SETRAMRD                       
271A- 29 FF                AND   #$FF                           
271C- 00                   BRK                                  
271D- 48                   PHA                                  
271E- 9B                   ???                                  
271F- 4C F0 00             JMP   $00F0                          
2722- C8                   INY                                  
2723- BB                   ???                                  
2724- B1 F2                LDA   ($F2),Y                        
2726- A8                   TAY                                  
2727- 8E 02 C0             STX   CLRRAMRD                       
272A- B1 E0                LDA   (XO),Y                         
272C- 8E 03 C0             STX   SETRAMRD                       
272F- 48                   PHA                                  
2730- 9B                   ???                                  
2731- 4C F0 00             JMP   $00F0                          
2734- C8                   INY                                  
2735- BB                   ???                                  
2736- B1 F2                LDA   ($F2),Y                        
2738- A8                   TAY                                  
2739- B1 E0                LDA   (XO),Y                         
273B- 29 FF                AND   #$FF                           
273D- 00                   BRK                                  
273E- 9B                   ???                                  
273F- 18                   CLC                                  
2740- 63                   ???                                  
2741- 01 83                ORA   ($83,X)                        
2743- 01 4C                ORA   ($4C,X)                        
2745- F0 00                BEQ   L2747                          
2747- C8        L2747      INY                                  
2748- BB                   ???                                  
2749- B1 F2                LDA   ($F2),Y                        
274B- A8                   TAY                                  
274C- 8E 02 C0             STX   CLRRAMRD                       
274F- B1 E0                LDA   (XO),Y                         
2751- 8E 03 C0             STX   SETRAMRD                       
2754- 29 FF                AND   #$FF                           
2756- 00                   BRK                                  
2757- 9B                   ???                                  
2758- 18                   CLC                                  
2759- 63                   ???                                  
275A- 01 83                ORA   ($83,X)                        
275C- 01 4C                ORA   ($4C,X)                        
275E- F0 00                BEQ   L2760                          
2760- C8        L2760      INY                                  
2761- BB                   ???                                  
2762- B1 F2                LDA   ($F2),Y                        
2764- A8                   TAY                                  
2765- B1 E0                LDA   (XO),Y                         
2767- 9B                   ???                                  
2768- 18                   CLC                                  
2769- 63                   ???                                  
276A- 01 83                ORA   ($83,X)                        
276C- 01 4C                ORA   ($4C,X)                        
276E- F0 00                BEQ   L2770                          
2770- C8        L2770      INY                                  
2771- BB                   ???                                  
2772- B1 F2                LDA   ($F2),Y                        
2774- A8                   TAY                                  
2775- 8E 02 C0             STX   CLRRAMRD                       
2778- B1 E0                LDA   (XO),Y                         
277A- 8E 03 C0             STX   SETRAMRD                       
277D- 9B                   ???                                  
277E- 18                   CLC                                  
277F- 63                   ???                                  
2780- 01 83                ORA   ($83,X)                        
2782- 01 4C                ORA   ($4C,X)                        
2784- F0 00                BEQ   L2786                          
2786- C8        L2786      INY                                  
2787- BB                   ???                                  
2788- B1 F2                LDA   ($F2),Y                        
278A- A8                   TAY                                  
278B- B1 E0                LDA   (XO),Y                         
278D- 29 FF                AND   #$FF                           
278F- 00                   BRK                                  
2790- 9B                   ???                                  
2791- 0A                   ASL                                  
2792- 18                   CLC                                  
2793- 63                   ???                                  
2794- 01 83                ORA   ($83,X)                        
2796- 01 4C                ORA   ($4C,X)                        
2798- F0 00                BEQ   L279A                          
279A- C8        L279A      INY                                  
279B- BB                   ???                                  
279C- B1 F2                LDA   ($F2),Y                        
279E- A8                   TAY                                  
279F- 8E 02 C0             STX   CLRRAMRD                       
27A2- B1 E0                LDA   (XO),Y                         
27A4- 8E 03 C0             STX   SETRAMRD                       
27A7- 29 FF                AND   #$FF                           
27A9- 00                   BRK                                  
27AA- 9B                   ???                                  
27AB- 0A                   ASL                                  
27AC- 18                   CLC                                  
27AD- 63                   ???                                  
27AE- 01 83                ORA   ($83,X)                        
27B0- 01 4C                ORA   ($4C,X)                        
27B2- F0 00                BEQ   L27B4                          
27B4- C8        L27B4      INY                                  
27B5- BB                   ???                                  
27B6- B1 F2                LDA   ($F2),Y                        
27B8- A8                   TAY                                  
27B9- B1 E0                LDA   (XO),Y                         
27BB- 9B                   ???                                  
27BC- 0A                   ASL                                  
27BD- 18                   CLC                                  
27BE- 63                   ???                                  
27BF- 01 83                ORA   ($83,X)                        
27C1- 01 4C                ORA   ($4C,X)                        
27C3- F0 00                BEQ   L27C5                          
27C5- C8        L27C5      INY                                  
27C6- BB                   ???                                  
27C7- B1 F2                LDA   ($F2),Y                        
27C9- A8                   TAY                                  
27CA- 8E 02 C0             STX   CLRRAMRD                       
27CD- B1 E0                LDA   (XO),Y                         
27CF- 8E 03 C0             STX   SETRAMRD                       
27D2- 9B                   ???                                  
27D3- 0A                   ASL                                  
27D4- 18                   CLC                                  
27D5- 63                   ???                                  
27D6- 01 83                ORA   ($83,X)                        
27D8- 01 4C                ORA   ($4C,X)                        
27DA- F0 00                BEQ   L27DC                          
27DC- C8        L27DC      INY                                  
27DD- B1 F2                LDA   ($F2),Y                        
27DF- 85 E7                STA   $E7                            
27E1- 98                   TYA                                  
27E2- E2 20                ???   WNDLFT                         
27E4- B2 E7                LDA   ($E7)                          
27E6- C2 20                ???   WNDLFT                         
27E8- 48                   PHA                                  
27E9- C8                   INY                                  
27EA- 4C F0 00             JMP   $00F0                          
27ED- C8                   INY                                  
27EE- B1 F2                LDA   ($F2),Y                        
27F0- 85 E7                STA   $E7                            
27F2- B2 E7                LDA   ($E7)                          
27F4- 48                   PHA                                  
27F5- C8                   INY                                  
27F6- 4C F0 00             JMP   $00F0                          
27F9- C8                   INY                                  
27FA- B1 F2                LDA   ($F2),Y                        
27FC- 85 E7                STA   $E7                            
27FE- 98                   TYA                                  
27FF- 8E 02 C0             STX   CLRRAMRD                       
2802- E2 20                ???   WNDLFT                         
2804- B2 E7                LDA   ($E7)                          
2806- C2 20                ???   WNDLFT                         
2808- 8E 03 C0             STX   SETRAMRD                       
280B- 48                   PHA                                  
280C- C8                   INY                                  
280D- 4C F0 00             JMP   $00F0                          
2810- C8                   INY                                  
2811- B1 F2                LDA   ($F2),Y                        
2813- 85 E7                STA   $E7                            
2815- 8E 02 C0             STX   CLRRAMRD                       
2818- B2 E7                LDA   ($E7)                          
281A- 8E 03 C0             STX   SETRAMRD                       
281D- 48                   PHA                                  
281E- C8                   INY                                  
281F- 4C F0 00             JMP   $00F0                          
2822- C8                   INY                                  
2823- B1 F2                LDA   ($F2),Y                        
2825- 85 E7                STA   $E7                            
2827- 98                   TYA                                  
2828- E2 20                ???   WNDLFT                         
282A- B2 E7                LDA   ($E7)                          
282C- C2 20                ???   WNDLFT                         
282E- C8                   INY                                  
282F- 18                   CLC                                  
2830- 63                   ???                                  
2831- 01 83                ORA   ($83,X)                        
2833- 01 4C                ORA   ($4C,X)                        
2835- F0 00                BEQ   L2837                          
2837- C8        L2837      INY                                  
2838- B1 F2                LDA   ($F2),Y                        
283A- 85 E7                STA   $E7                            
283C- 98                   TYA                                  
283D- 8E 02 C0             STX   CLRRAMRD                       
2840- E2 20                ???   WNDLFT                         
2842- B2 E7                LDA   ($E7)                          
2844- C2 20                ???   WNDLFT                         
2846- 8E 03 C0             STX   SETRAMRD                       
2849- C8                   INY                                  
284A- 18                   CLC                                  
284B- 63                   ???                                  
284C- 01 83                ORA   ($83,X)                        
284E- 01 4C                ORA   ($4C,X)                        
2850- F0 00                BEQ   L2852                          
2852- C8        L2852      INY                                  
2853- B1 F2                LDA   ($F2),Y                        
2855- 85 E7                STA   $E7                            
2857- B2 E7                LDA   ($E7)                          
2859- C8                   INY                                  
285A- 18                   CLC                                  
285B- 63                   ???                                  
285C- 01 83                ORA   ($83,X)                        
285E- 01 4C                ORA   ($4C,X)                        
2860- F0 00                BEQ   L2862                          
2862- C8        L2862      INY                                  
2863- B1 F2                LDA   ($F2),Y                        
2865- 85 E7                STA   $E7                            
2867- 8E 02 C0             STX   CLRRAMRD                       
286A- B2 E7                LDA   ($E7)                          
286C- 8E 03 C0             STX   SETRAMRD                       
286F- C8                   INY                                  
2870- 18                   CLC                                  
2871- 63                   ???                                  
2872- 01 83                ORA   ($83,X)                        
2874- 01 4C                ORA   ($4C,X)                        
2876- F0 00                BEQ   L2878                          
2878- C8        L2878      INY                                  
2879- B1 F2                LDA   ($F2),Y                        
287B- 85 E7                STA   $E7                            
287D- 98                   TYA                                  
287E- E2 20                ???   WNDLFT                         
2880- B2 E7                LDA   ($E7)                          
2882- C2 20                ???   WNDLFT                         
2884- C8                   INY                                  
2885- 0A                   ASL                                  
2886- 18                   CLC                                  
2887- 63                   ???                                  
2888- 01 83                ORA   ($83,X)                        
288A- 01 4C                ORA   ($4C,X)                        
288C- F0 00                BEQ   L288E                          
288E- C8        L288E      INY                                  
288F- B1 F2                LDA   ($F2),Y                        
2891- 85 E7                STA   $E7                            
2893- 98                   TYA                                  
2894- 8E 02 C0             STX   CLRRAMRD                       
2897- E2 20                ???   WNDLFT                         
2899- B2 E7                LDA   ($E7)                          
289B- C2 20                ???   WNDLFT                         
289D- 8E 03 C0             STX   SETRAMRD                       
28A0- C8                   INY                                  
28A1- 0A                   ASL                                  
28A2- 18                   CLC                                  
28A3- 63                   ???                                  
28A4- 01 83                ORA   ($83,X)                        
28A6- 01 4C                ORA   ($4C,X)                        
28A8- F0 00                BEQ   L28AA                          
28AA- C8        L28AA      INY                                  
28AB- B1 F2                LDA   ($F2),Y                        
28AD- 85 E7                STA   $E7                            
28AF- B2 E7                LDA   ($E7)                          
28B1- C8                   INY                                  
28B2- 0A                   ASL                                  
28B3- 18                   CLC                                  
28B4- 63                   ???                                  
28B5- 01 83                ORA   ($83,X)                        
28B7- 01 4C                ORA   ($4C,X)                        
28B9- F0 00                BEQ   L28BB                          
28BB- C8        L28BB      INY                                  
28BC- B1 F2                LDA   ($F2),Y                        
28BE- 85 E7                STA   $E7                            
28C0- 8E 02 C0             STX   CLRRAMRD                       
28C3- B2 E7                LDA   ($E7)                          
28C5- 8E 03 C0             STX   SETRAMRD                       
28C8- C8                   INY                                  
28C9- 0A                   ASL                                  
28CA- 18                   CLC                                  
28CB- 63                   ???                                  
28CC- 01 83                ORA   ($83,X)                        
28CE- 01 4C                ORA   ($4C,X)                        
28D0- F0 00                BEQ   L28D2                          
28D2- BB        L28D2      ???                                  
28D3- A0 00                LDY   #$00                           
28D5- E2 20                ???   WNDLFT                         
28D7- A3                   ???                                  
28D8- 03                   ???                                  
28D9- 93                   ???                                  
28DA- 01 C2                ORA   ($C2,X)                        
28DC- 20 9B 68             JSR   $689B                          
28DF- 4C EF 00             JMP   $00EF                          
28E2- BB                   ???                                  
28E3- A0 00                LDY   #$00                           
28E5- A3                   ???                                  
28E6- 03                   ???                                  
28E7- 93                   ???                                  
28E8- 01 9B                ORA   ($9B,X)                        
28EA- 68                   PLA                                  
28EB- 4C EF 00             JMP   $00EF                          
28EE- C8                   INY                                  
28EF- BB                   ???                                  
28F0- B1 F2                LDA   ($F2),Y                        
28F2- A8                   TAY                                  
28F3- 68                   PLA                                  
28F4- E2 20                ???   WNDLFT                         
28F6- 91 E0                STA   (XO),Y                         
28F8- C2 20                ???   WNDLFT                         
28FA- 9B                   ???                                  
28FB- 30 11                BMI   L290E                          
28FD- 4C F0 00             JMP   $00F0                          
2900- C8                   INY                                  
2901- B1 F2                LDA   ($F2),Y                        
2903- BB                   ???                                  
2904- A8                   TAY                                  
2905- 68                   PLA                                  
2906- 91 E0     L2906      STA   (XO),Y                         
2908- 9B                   ???                                  
2909- 30 03                BMI   L290E                          
290B- 4C F0 00             JMP   $00F0                          
290E- 4C B4 D8  L290E      JMP   $D8B4                          
2911- C8                   INY                                  
2912- BB                   ???                                  
2913- E2 20                ???   WNDLFT                         
2915- B1 F2                LDA   ($F2),Y                        
2917- A8                   TAY                                  
2918- A3                   ???                                  
2919- 01 91                ORA   ($91,X)                        
291B- E0 C2                CPX   #$C2                           
291D- 20 29 FF             JSR   $FF29                          
2920- 00                   BRK                                  
2921- 83                   ???                                  
2922- 01 9B                ORA   ($9B,X)                        
2924- 4C F0 00             JMP   $00F0                          
2927- C8                   INY                                  
2928- B1 F2                LDA   ($F2),Y                        
292A- BB                   ???                                  
292B- A8                   TAY                                  
292C- A3                   ???                                  
292D- 01 91                ORA   ($91,X)                        
292F- E0 9B                CPX   #$9B                           
2931- 4C F0 00             JMP   $00F0                          
2934- C8                   INY                                  
2935- B1 F2                LDA   ($F2),Y                        
2937- 85 E7                STA   $E7                            
2939- 68                   PLA                                  
293A- E2 20                ???   WNDLFT                         
293C- 92 E7                STA   ($E7)                          
293E- C2 20                ???   WNDLFT                         
2940- C8                   INY                                  
2941- 30 11                BMI   L2954                          
2943- 4C F0 00             JMP   $00F0                          
2946- C8                   INY                                  
2947- B1 F2                LDA   ($F2),Y                        
2949- 85 E7                STA   $E7                            
294B- 68                   PLA                                  
294C- 92 E7                STA   ($E7)                          
294E- C8                   INY                                  
294F- 30 03                BMI   L2954                          
2951- 4C F0 00             JMP   $00F0                          
2954- 4C B4 D8  L2954      JMP   $D8B4                          
2957- C8                   INY                                  
2958- B1 F2                LDA   ($F2),Y                        
295A- 85 E7                STA   $E7                            
295C- E2 20                ???   WNDLFT                         
295E- A3                   ???                                  
295F- 01 92                ORA   ($92,X)                        
2961- E7 C2                ???   $C2                            
2963- 20 29 FF             JSR   $FF29                          
2966- 00                   BRK                                  
2967- 83                   ???                                  
2968- 01 C8                ORA   ($C8,X)                        
296A- 4C F0 00             JMP   $00F0                          
296D- C8                   INY                                  
296E- B1 F2                LDA   ($F2),Y                        
2970- 85 E7                STA   $E7                            
2972- A3                   ???                                  
2973- 01 92                ORA   ($92,X)                        
2975- E7 C8                ???   $C8                            
2977- 4C F0 00             JMP   $00F0                          
297A- 68                   PLA                                  
297B- C3                   ???                                  
297C- 01 D0                ORA   ($D0,X)                        
297E- 0D A9 FF             ORA   $FFA9                          
2981- FF 83                ???   L2906                          
2983- 01 4C                ORA   ($4C,X)                        
2985- F0 00                BEQ   L2987                          
2987- 68        L2987      PLA                                  
2988- C3                   ???                                  
2989- 01 D0                ORA   ($D0,X)                        
298B- F3                   ???                                  
298C- A9 00     L298C      LDA   #$00                           
298E- 00                   BRK                                  
298F- 83                   ???                                  
2990- 01 4C                ORA   ($4C,X)                        
2992- F0 00                BEQ   L2994                          
2994- 68        L2994      PLA                                  
2995- 38                   SEC                                  
2996- E3                   ???                                  
2997- 01 70                ORA   ($70,X)                        
2999- 06 30                ASL   COLOR                          
299B- E3                   ???                                  
299C- F0 E1                BEQ   L297F                          
299E- 10 EC                BPL   L298C                          
29A0- 30 EA                BMI   L298C                          
29A2- F0 E8                BEQ   L298C                          
29A4- 10 D9                BPL   L297F                          
29A6- 68                   PLA                                  
29A7- 38                   SEC                                  
29A8- E3                   ???                                  
29A9- 01 70                ORA   ($70,X)                        
29AB- 04 30                TSB   COLOR                          
29AD- D1 10                CMP   ($10),Y                        
29AF- DC 30 DA             ???   $DA30                          
29B2- 10 CB                BPL   L297F                          
29B4- 68                   PLA                                  
29B5- 38                   SEC                                  
29B6- E3                   ???                                  
29B7- 01 70                ORA   ($70,X)                        
29B9- 04 10                TSB   $10                            
29BB- C3                   ???                                  
29BC- 30 CE                BMI   L298C                          
29BE- 10 CC                BPL   L298C                          
29C0- 30 BD                BMI   L297F                          
29C2- 68                   PLA                                  
29C3- 38                   SEC                                  
29C4- E3                   ???                                  
29C5- 01 70                ORA   ($70,X)                        
29C7- 06 30                ASL   COLOR                          
29C9- C2 F0                ???   $F0                            
29CB- C0 10                CPY   #$10                           
29CD- B1 30                LDA   (COLOR),Y                      
29CF- AF F0                ???   L29C1                          
29D1- AD 10 B8             LDA   $B810                          
29D4- 98                   TYA                                  
29D5- 38                   SEC                                  
29D6- 65 F2                ADC   $F2                            
29D8- C8                   INY                                  
29D9- 71 F2                ADC   ($F2),Y                        
29DB- 85 F2                STA   $F2                            
29DD- A0 00                LDY   #$00                           
29DF- B1 F2                LDA   ($F2),Y                        
29E1- AA                   TAX                                  
29E2- 68                   PLA                                  
29E3- E6 F2                INC   $F2                            
29E5- D1 F2     L29E5      CMP   ($F2),Y                        
29E7- F0 13                BEQ   L29FC                          
29E9- 30 14                BMI   L29FF                          
29EB- C8                   INY                                  
29EC- C8                   INY                                  
29ED- C8                   INY                                  
29EE- CA                   DEX                                  
29EF- F0 16                BEQ   L2A07                          
29F1- C8                   INY                                  
29F2- D0 F1                BNE   L29E5                          
29F4- E2 20                ???   WNDLFT                         
29F6- E6 F3                INC   $F3                            
29F8- C2 20                ???   WNDLFT                         
29FA- 80 E9                BRA   L29E5                          
29FC- C8        L29FC      INY                                  
29FD- 80 41                BRA   L2A40                          
29FF- 8A        L29FF      TXA                                  
2A00- 0A                   ASL                                  
2A01- 0A                   ASL                                  
2A02- 3A                   DEC                                  
2A03- 65 F2                ADC   $F2                            
2A05- 85 F2                STA   $F2                            
2A07- 98        L2A07      TYA                                  
2A08- A0 00                LDY   #$00                           
2A0A- 38                   SEC                                  
2A0B- 65 F2                ADC   $F2                            
2A0D- 85 F2                STA   $F2                            
2A0F- 4C F1 00             JMP   $00F1                          
2A12- A3                   ???                                  
2A13- 01 F0                ORA   ($F0,X)                        
2A15- 2A                   ROL                                  
2A16- 68                   PLA                                  
2A17- 80 1D                BRA   L2A36                          
2A19- A3                   ???                                  
2A1A- 01 D0                ORA   ($D0,X)                        
2A1C- 23                   ???                                  
2A1D- 68                   PLA                                  
2A1E- 80 16                BRA   L2A36                          
2A20- 68                   PLA                                  
2A21- C3                   ???                                  
2A22- 01 D0                ORA   ($D0,X)                        
2A24- 0B                   ???                                  
2A25- 68                   PLA                                  
2A26- 80 18                BRA   L2A40                          
2A28- 68                   PLA                                  
2A29- C3                   ???                                  
2A2A- 01 F0                ORA   ($F0,X)                        
2A2C- 03                   ???                                  
2A2D- 68                   PLA                                  
2A2E- 80 10                BRA   L2A40                          
2A30- 68                   PLA                                  
2A31- 80 03                BRA   L2A36                          
2A33- 68                   PLA                                  
2A34- D0 0A                BNE   L2A40                          
2A36- C8        L2A36      INY                                  
2A37- C8                   INY                                  
2A38- 30 CD                BMI   L2A07                          
2A3A- 4C F0 00             JMP   $00F0                          
2A3D- 68                   PLA                                  
2A3E- D0 F6                BNE   L2A36                          
2A40- 98        L2A40      TYA                                  
2A41- 38                   SEC                                  
2A42- 65 F2                ADC   $F2                            
2A44- C8                   INY                                  
2A45- 71 F2                ADC   ($F2),Y                        
2A47- 85 F2                STA   $F2                            
2A49- A0 00                LDY   #$00                           
2A4B- 4C F1 00             JMP   $00F1                          
2A4E- A3                   ???                                  
2A4F- 03                   ???                                  
2A50- 38                   SEC                                  
2A51- E3                   ???                                  
2A52- 01 70                ORA   ($70,X)                        
2A54- 0F 10                ???   L2A66                          
2A56- DF 30                ???   L2A88                          
2A58- E7 A3                ???   $A3                            
2A5A- 01 38                ORA   (KSWL,X)                       
2A5C- E3                   ???                                  
2A5D- 03                   ???                                  
2A5E- 70 04                BVS   L2A64                          
2A60- 10 D4                BPL   L2A36                          
2A62- 30 DC                BMI   L2A40                          
2A64- 30 D0     L2A64      BMI   L2A36                          
2A66- 10 D8     L2A66      BPL   L2A40                          
2A68- 68                   PLA                                  
2A69- 3A                   DEC                                  
2A6A- 48                   PHA                                  
2A6B- A3        L2A6B      ???                                  
2A6C- 01 38                ORA   (KSWL,X)                       
2A6E- E3                   ???                                  
2A6F- 03                   ???                                  
2A70- 70 12                BVS   L2A84                          
2A72- 10 CC                BPL   L2A40                          
2A74- 30 C0                BMI   L2A36                          
2A76- 68                   PLA                                  
2A77- 1A                   INC                                  
2A78- 48                   PHA                                  
2A79- A3                   ???                                  
2A7A- 03                   ???                                  
2A7B- 38                   SEC                                  
2A7C- E3                   ???                                  
2A7D- 01 70                ORA   ($70,X)                        
2A7F- 04 10                TSB   $10                            
2A81- BE 30 B2             LDX   $B230,Y                        
2A84- 30 BA     L2A84      BMI   L2A40                          
2A86- 10 AE                BPL   L2A36                          
2A88- A3        L2A88      ???                                  
2A89- 03                   ???                                  
2A8A- 38                   SEC                                  
2A8B- E3                   ???                                  
2A8C- 01 83                ORA   ($83,X)                        
2A8E- 03                   ???                                  
2A8F- 68                   PLA                                  
2A90- 80 D9                BRA   L2A6B                          
2A92- 68                   PLA                                  
2A93- 18                   CLC                                  
2A94- 63                   ???                                  
2A95- 01 83                ORA   ($83,X)                        
2A97- 01 80                ORA   ($80,X)                        
2A99- DF 68                ???   L2B03                          
2A9B- 80 04                BRA   L2AA1                          
2A9D- C8                   INY                                  
2A9E- B1 F2                LDA   ($F2),Y                        
2AA0- C8                   INY                                  
2AA1- 85 E7     L2AA1      STA   $E7                            
2AA3- 98                   TYA                                  
2AA4- 38                   SEC                                  
2AA5- 65 F2                ADC   $F2                            
2AA7- 85 F2                STA   $F2                            
2AA9- 20 2C DB             JSR   $DB2C                          
2AAC- B2 E7                LDA   ($E7)                          
2AAE- 29 FF                AND   #$FF                           
2AB0- F3                   ???                                  
2AB1- C9 20                CMP   #$20                           
2AB3- D0 D0                BNE   L2A85                          
2AB5- 0E A0 01             ASL   $01A0                          
2AB8- B1 E7                LDA   ($E7),Y                        
2ABA- C9 D0                CMP   #$D0                           
2ABC- 03                   ???                                  
2ABD- F0 5D                BEQ   L2B1C                          
2ABF- C9 DC                CMP   #$DC                           
2AC1- 03                   ???                                  
2AC2- F0 71                BEQ   L2B35                          
2AC4- 64 EC                STZ   $EC                            
2AC6- 64 ED                STZ   $ED                            
2AC8- 38                   SEC                                  
2AC9- FB                   ???                                  
2ACA- 3B                   ???                                  
2ACB- 18                   CLC                                  
2ACC- 69 40                ADC   #$40                           
2ACE- 38                   SEC                                  
2ACF- E5 EA                SBC   $EA                            
2AD1- 4A                   LSR                                  
2AD2- AA                   TAX                                  
2AD3- E0 20                CPX   #$20                           
2AD5- F0 0E                BEQ   L2AE5                          
2AD7- A8                   TAY                                  
2AD8- 68        L2AD8      PLA                                  
2AD9- 99 C0 00             STA   $00C0,Y                        
2ADC- 68                   PLA                                  
2ADD- 99 A0 00             STA   $00A0,Y                        
2AE0- C8                   INY                                  
2AE1- C0 20                CPY   #$20                           
2AE3- D0 F3                BNE   L2AD8                          
2AE5- D4 F2     L2AE5      ???   $F2                            
2AE7- A5 E9                LDA   $E9                            
2AE9- 48                   PHA                                  
2AEA- 28                   PLP                                  
2AEB- 20 E6 00             JSR   HPAG                           
2AEE- 08                   PHP                                  
2AEF- 68                   PLA                                  
2AF0- 85 E9                STA   $E9                            
2AF2- 78                   SEI                                  
2AF3- 18                   CLC                                  
2AF4- FB                   ???                                  
2AF5- C2 20                ???   WNDLFT                         
2AF7- 68                   PLA                                  
2AF8- 85 F2                STA   $F2                            
2AFA- 86 E5                STX   $E5                            
2AFC- BA                   TSX                                  
2AFD- 86 EA                STX   $EA                            
2AFF- A2 20                LDX   #$20                           
2B01- E4 E5                CPX   $E5                            
2B03- F0 0B     L2B03      BEQ   L2B10                          
2B05- CA        L2B05      DEX                                  
2B06- B4 A0                LDY   $A0,X                          
2B08- 5A                   PHY                                  
2B09- B4 C0                LDY   $C0,X                          
2B0B- 5A                   PHY                                  
2B0C- E4 E5                CPX   $E5                            
2B0E- D0 F5                BNE   L2B05                          
2B10- 20 44 DB  L2B10      JSR   $DB44                          
2B13- A2 D0                LDX   #$D0                           
2B15- 86 F6                STX   $F6                            
2B17- A0 00                LDY   #$00                           
2B19- 4C F1 00             JMP   $00F1                          
2B1C- A6 F6     L2B1C      LDX   $F6                            
2B1E- 86 EC                STX   $EC                            
2B20- A5 F2                LDA   $F2                            
2B22- 85 ED                STA   $ED                            
2B24- A5 E7                LDA   $E7                            
2B26- 18                   CLC                                  
2B27- 69 03                ADC   #$03                           
2B29- 00                   BRK                                  
2B2A- 85 F2                STA   $F2                            
2B2C- A2 D0                LDX   #$D0                           
2B2E- 86 F6                STX   $F6                            
2B30- A0 00                LDY   #$00                           
2B32- 4C F1 00             JMP   $00F1                          
2B35- A6 F6     L2B35      LDX   $F6                            
2B37- 86 EC                STX   $EC                            
2B39- A5 F2                LDA   $F2                            
2B3B- 85 ED                STA   $ED                            
2B3D- A0 03                LDY   #$03                           
2B3F- B1 E7                LDA   ($E7),Y                        
2B41- 85 F2                STA   $F2                            
2B43- A2 D2                LDX   #$D2                           
2B45- 86 F6                STX   $F6                            
2B47- 8E 03 C0             STX   SETRAMRD                       
2B4A- A0 00                LDY   #$00                           
2B4C- 4C F1 00             JMP   $00F1                          
2B4F- 68                   PLA                                  
2B50- 80 04                BRA   L2B56                          
2B52- C8                   INY                                  
2B53- B1 F2                LDA   ($F2),Y                        
2B55- C8                   INY                                  
2B56- 85 E7     L2B56      STA   $E7                            
2B58- 98                   TYA                                  
2B59- 38                   SEC                                  
2B5A- 65 F2                ADC   $F2                            
2B5C- 85 F2                STA   $F2                            
2B5E- 20 2C DB             JSR   $DB2C                          
2B61- 8E 02 C0             STX   CLRRAMRD                       
2B64- B2 E7                LDA   ($E7)                          
2B66- 29 FF                AND   #$FF                           
2B68- F0 C9                BEQ   L2B33                          
2B6A- 20 D0 D0             JSR   $D0D0                          
2B6D- 0E A0 01             ASL   $01A0                          
2B70- B1 E7                LDA   ($E7),Y                        
2B72- C9 D0                CMP   #$D0                           
2B74- 03                   ???                                  
2B75- F0 A5                BEQ   L2B1C                          
2B77- C9 DC                CMP   #$DC                           
2B79- 03                   ???                                  
2B7A- F0 B9                BEQ   L2B35                          
2B7C- 64 EC                STZ   $EC                            
2B7E- 64 ED                STZ   $ED                            
2B80- 38                   SEC                                  
2B81- FB                   ???                                  
2B82- 3B                   ???                                  
2B83- 18                   CLC                                  
2B84- 69 40                ADC   #$40                           
2B86- 38                   SEC                                  
2B87- E5 EA                SBC   $EA                            
2B89- 4A                   LSR                                  
2B8A- AA                   TAX                                  
2B8B- E0 20                CPX   #$20                           
2B8D- F0 0E                BEQ   L2B9D                          
2B8F- A8                   TAY                                  
2B90- 68        L2B90      PLA                                  
2B91- 99 C0 00             STA   $00C0,Y                        
2B94- 68                   PLA                                  
2B95- 99 A0 00             STA   $00A0,Y                        
2B98- C8                   INY                                  
2B99- C0 20                CPY   #$20                           
2B9B- D0 F3                BNE   L2B90                          
2B9D- D4 F2     L2B9D      ???   $F2                            
2B9F- A5 E9                LDA   $E9                            
2BA1- 48                   PHA                                  
2BA2- 28                   PLP                                  
2BA3- 20 E6 00             JSR   HPAG                           
2BA6- 08                   PHP                                  
2BA7- 68                   PLA                                  
2BA8- 85 E9                STA   $E9                            
2BAA- 78                   SEI                                  
2BAB- 18                   CLC                                  
2BAC- FB                   ???                                  
2BAD- C2 20                ???   WNDLFT                         
2BAF- 68                   PLA                                  
2BB0- 85 F2                STA   $F2                            
2BB2- 86 E5                STX   $E5                            
2BB4- BA                   TSX                                  
2BB5- 86 EA                STX   $EA                            
2BB7- A2 20                LDX   #$20                           
2BB9- E4 E5                CPX   $E5                            
2BBB- F0 0B                BEQ   L2BC8                          
2BBD- CA        L2BBD      DEX                                  
2BBE- B4 A0                LDY   $A0,X                          
2BC0- 5A                   PHY                                  
2BC1- B4 C0                LDY   $C0,X                          
2BC3- 5A                   PHY                                  
2BC4- E4 E5                CPX   $E5                            
2BC6- D0 F5                BNE   L2BBD                          
2BC8- 20 44 DB  L2BC8      JSR   $DB44                          
2BCB- 8E 03 C0             STX   SETRAMRD                       
2BCE- A2 D2                LDX   #$D2                           
2BD0- 86 F6                STX   $F6                            
2BD2- A0 00                LDY   #$00                           
2BD4- 4C F1 00             JMP   $00F1                          
2BD7- A5 E0                LDA   XO                             
2BD9- 85 E7                STA   $E7                            
2BDB- C8                   INY                                  
2BDC- B1 F2                LDA   ($F2),Y                        
2BDE- 29 FF                AND   #$FF                           
2BE0- 00                   BRK                                  
2BE1- AA                   TAX                                  
2BE2- 1A                   INC                                  
2BE3- 1A                   INC                                  
2BE4- 49 FF                EOR   #$FF                           
2BE6- FF 38                ???   L2C20                          
2BE8- 65 E2                ADC   YO                             
2BEA- 85 E2                STA   YO                             
2BEC- 85 E0                STA   XO                             
2BEE- C8                   INY                                  
2BEF- B1 F2                LDA   ($F2),Y                        
2BF1- 29 FF                AND   #$FF                           
2BF3- 00                   BRK                                  
2BF4- F0 09                BEQ   L2BFF                          
2BF6- 0A                   ASL                                  
2BF7- A8                   TAY                                  
2BF8- 68        L2BF8      PLA                                  
2BF9- 88                   DEY                                  
2BFA- 88                   DEY                                  
2BFB- 91 E0                STA   (XO),Y                         
2BFD- D0 F9                BNE   L2BF8                          
2BFF- 9B        L2BFF      ???                                  
2C00- A5 E7                LDA   $E7                            
2C02- 91 E0                STA   (XO),Y                         
2C04- A0 03                LDY   #$03                           
2C06- 4C F1 00             JMP   $00F1                          
2C09- C8                   INY                                  
2C0A- B1 F2                LDA   ($F2),Y                        
2C0C- 29 FF                AND   #$FF                           
2C0E- 00                   BRK                                  
2C0F- A8                   TAY                                  
2C10- 18                   CLC                                  
2C11- 69 02                ADC   #$02                           
2C13- 00                   BRK                                  
2C14- 65 E0                ADC   XO                             
2C16- 85 E2                STA   YO                             
2C18- 8E 02 C0             STX   CLRRAMRD                       
2C1B- B1 E0                LDA   (XO),Y                         
2C1D- 85 E0                STA   XO                             
2C1F- 8E 02 C0             STX   CLRRAMRD                       
2C22- A5 ED                LDA   $ED                            
2C24- F0 15                BEQ   L2C3B                          
2C26- 85 F2                STA   $F2                            
2C28- A6 EC                LDX   $EC                            
2C2A- 86 F6                STX   $F6                            
2C2C- E0 D2                CPX   #$D2                           
2C2E- D0 03                BNE   L2C33                          
2C30- 8E 03 C0             STX   SETRAMRD                       
2C33- 20 44 DB  L2C33      JSR   $DB44                          
2C36- A0 00                LDY   #$00                           
2C38- 4C F1 00             JMP   $00F1                          
2C3B- 38        L2C3B      SEC                                  
2C3C- FB                   ???                                  
2C3D- 3B                   ???                                  
2C3E- 18                   CLC                                  
2C3F- 69 40                ADC   #$40                           
2C41- 38                   SEC                                  
2C42- E5 EA                SBC   $EA                            
2C44- 4A                   LSR                                  
2C45- AA                   TAX                                  
2C46- E0 20                CPX   #$20                           
2C48- F0 0E                BEQ   L2C58                          
2C4A- A8                   TAY                                  
2C4B- 68        L2C4B      PLA                                  
2C4C- 99 C0 00             STA   $00C0,Y                        
2C4F- 68                   PLA                                  
2C50- 99 A0 00             STA   $00A0,Y                        
2C53- C8                   INY                                  
2C54- C0 20                CPY   #$20                           
2C56- D0 F3                BNE   L2C4B                          
2C58- A5 E9     L2C58      LDA   $E9                            
2C5A- 48                   PHA                                  
2C5B- 28                   PLP                                  
2C5C- 60                   RTS                                  
2C5D- 98                   TYA                                  
2C5E- 38                   SEC                                  
2C5F- 65 F2                ADC   $F2                            
2C61- 85 F2                STA   $F2                            
2C63- C2 10                ???   $10                            
2C65- 6C F2 00             JMP   ($00F2)                        
2C68- 68                   PLA                                  
2C69- F0 0A                BEQ   L2C75                          
2C6B- C8                   INY                                  
2C6C- C8                   INY                                  
2C6D- 30 03                BMI   L2C72                          
2C6F- 4C F0 00             JMP   $00F0                          
2C72- 4C B4 D8  L2C72      JMP   $D8B4                          
2C75- C8        L2C75      INY                                  
2C76- B1 F2                LDA   ($F2),Y                        
2C78- 85 F2                STA   $F2                            
2C7A- A0 00                LDY   #$00                           
2C7C- 4C F1 00             JMP   $00F1                          
2C7F- A6 EB                LDX   $EB                            
2C81- CA                   DEX                                  
2C82- CA                   DEX                                  
2C83- CA                   DEX                                  
2C84- AC 83 C0             LDY   PHASE1ON                       
2C87- AC 83 C0             LDY   PHASE1ON                       
2C8A- A5 EC                LDA   $EC                            
2C8C- 9D 57 DB             STA   $DB57,X                        
2C8F- A5 ED                LDA   $ED                            
2C91- 9D 58 DB             STA   $DB58,X                        
2C94- 86 EB                STX   $EB                            
2C96- 60                   RTS                                  
2C97- A6 EB                LDX   $EB                            
2C99- BC 57 DB             LDY   $DB57,X                        
2C9C- 84 EC                STY   $EC                            
2C9E- BD 58 DB             LDA   $DB58,X                        
2CA1- 85 ED                STA   $ED                            
2CA3- E8                   INX                                  
2CA4- E8                   INX                                  
2CA5- E8                   INX                                  
2CA6- 86 EB                STX   $EB                            
2CA8- 60                   RTS                                  
