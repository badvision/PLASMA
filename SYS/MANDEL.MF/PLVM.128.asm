2000- AD 98 BF  L2000      LDA   $BF98                          
2003- 29 30                AND   #$30                           
2005- C9 30                CMP   #$30                           
2007- F0 4B                BEQ   L2054                          
2009- A0 00                LDY   #$00                           
200B- B9 2D 20  L200B      LDA   L202D,Y                        
200E- F0 08                BEQ   L2018                          
2010- 09 80                ORA   #$80                           
2012- 20 ED FD             JSR   COUT                           
2015- C8                   INY                                  
2016- D0 F3                BNE   L200B                          
2018- AD 00 C0  L2018      LDA   KBD                            
201B- 10 EE                BPL   L200B                          
201D- AD 10 C0             LDA   KBDSTRB                        
2020- 20 00 BF             JSR   MLI                            
2023- 65 26                ADC   GBASL                          
2025- 20 04 04             JSR   $0404                          
2028- 00                   BRK                                  
2029- 00                   BRK                                  
202A- 00                   BRK                                  
202B- 00                   BRK                                  
202C- 00                   BRK                                  
202D- 31 32     L202D      AND   ($32),Y                        
202F- 38                   SEC                                  
2030- 4B                   ???                                  
2031- 20 4D 45             JSR   $454D                          
2034- 4D 4F 52             EOR   $524F                          
2037- 59 20 52             EOR   $5220,Y                        
203A- 45 51                EOR   $51                            
203C- 55 49                EOR   $49,X                          
203E- 52 45                EOR   (A5H)                          
2040- 44 2E                ???   MASK                           
2042- 0D 50 52             ORA   $5250                          
2045- 45 53                EOR   $53                            
2047- 53                   ???                                  
2048- 20 41 4E             JSR   $4E41                          
204B- 59 20 4B             EOR   $4B20,Y                        
204E- 45 59                EOR   $59                            
2050- 2E 2E 2E             ROL   L2E2E                          
2053- 00                   BRK                                  
2054- AD 26 BF  L2054      LDA   $BF26                          
2057- CD 10 BF             CMP   $BF10                          
205A- D0 08                BNE   L2064                          
205C- AD 27 BF             LDA   $BF27                          
205F- CD 11 BF             CMP   $BF11                          
2062- F0 2B                BEQ   L208F                          
2064- AC 31 BF  L2064      LDY   $BF31                          
2067- B9 32 BF  L2067      LDA   $BF32,Y                        
206A- 29 F3                AND   #$F3                           
206C- C9 B3                CMP   #$B3                           
206E- F0 05                BEQ   L2075                          
2070- 88                   DEY                                  
2071- 10 F4                BPL   L2067                          
2073- 30 1A                BMI   L208F                          
2075- B9 33 BF  L2075      LDA   $BF33,Y                        
2078- 99 32 BF             STA   $BF32,Y                        
207B- F0 03                BEQ   L2080                          
207D- C8                   INY                                  
207E- D0 F5                BNE   L2075                          
2080- AD 10 BF  L2080      LDA   $BF10                          
2083- 8D 26 BF             STA   $BF26                          
2086- AD 11 BF             LDA   $BF11                          
2089- 8D 27 BF             STA   $BF27                          
208C- CE 31 BF             DEC   $BF31                          
208F- 2C 83 C0  L208F      BIT   PHASE1ON                       
2092- 2C 83 C0             BIT   PHASE1ON                       
2095- A9 1D                LDA   #$1D                           
2097- 85 06                STA   $06                            
2099- A9 21                LDA   #$21                           
209B- 85 07                STA   $07                            
209D- A0 00                LDY   #$00                           
209F- 84 08                STY   $08                            
20A1- A9 D0                LDA   #$D0                           
20A3- 85 09                STA   $09                            
20A5- B1 06     L20A5      LDA   ($06),Y                        
20A7- 91 08                STA   ($08),Y                        
20A9- C8                   INY                                  
20AA- D0 F9                BNE   L20A5                          
20AC- E6 07                INC   $07                            
20AE- E6 09                INC   $09                            
20B0- A5 09                LDA   $09                            
20B2- C9 E0                CMP   #$E0                           
20B4- D0 EF                BNE   L20A5                          
20B6- B9 00 D1  L20B6      LDA   $D100,Y                        
20B9- 99 00 10             STA   $1000,Y                        
20BC- C8                   INY                                  
20BD- D0 F7                BNE   L20B6                          
20BF- A9 00                LDA   #$00                           
20C1- 1A                   INC                                  
20C2- F0 03                BEQ   L20C7                          
20C4- 20 FC 2E             JSR   L2EFC                          
20C7- 20 00 BF  L20C7      JSR   MLI                            
20CA- C7 1A                ???   $1A                            
20CC- 21 AC                AND   ($AC,X)                        
20CE- 00                   BRK                                  
20CF- 03                   ???                                  
20D0- A9 2F                LDA   #$2F                           
20D2- D9 00 03             CMP   $0300,Y                        
20D5- F0 04                BEQ   L20DB                          
20D7- C8                   INY                                  
20D8- 99 00 03             STA   $0300,Y                        
20DB- A9 43     L20DB      LDA   #$43                           
20DD- C8                   INY                                  
20DE- 99 00 03             STA   $0300,Y                        
20E1- A9 4D                LDA   #$4D                           
20E3- C8                   INY                                  
20E4- 99 00 03             STA   $0300,Y                        
20E7- A9 44                LDA   #$44                           
20E9- C8                   INY                                  
20EA- 99 00 03             STA   $0300,Y                        
20ED- A9 2E                LDA   #$2E                           
20EF- C8                   INY                                  
20F0- 99 00 03             STA   $0300,Y                        
20F3- A9 31                LDA   #$31                           
20F5- C8                   INY                                  
20F6- 99 00 03             STA   $0300,Y                        
20F9- A9 32                LDA   #$32                           
20FB- C8                   INY                                  
20FC- 99 00 03             STA   $0300,Y                        
20FF- A9 38                LDA   #$38                           
2101- C8                   INY                                  
2102- 99 00 03             STA   $0300,Y                        
2105- 8C 00 03             STY   $0300                          
2108- 2C 83 C0             BIT   PHASE1ON                       
210B- 2C 83 C0             BIT   PHASE1ON                       
210E- B9 00 03  L210E      LDA   $0300,Y                        
2111- 99 D0 D1             STA   $D1D0,Y                        
2114- 88                   DEY                                  
2115- 10 F7                BPL   L210E                          
2117- 4C 0C 10             JMP   $100C                          
211A- 01 00                ORA   ($00,X)                        
211C- 03                   ???                                  
211D- 61 D5                ADC   ($D5,X)                        
211F- 69 D5                ADC   #$D5                           
2121- 69 D5                ADC   #$D5                           
2123- 69 D5                ADC   #$D5                           
2125- 69 D5                ADC   #$D5                           
2127- 69 D5                ADC   #$D5                           
2129- 69 D5                ADC   #$D5                           
212B- 69 D5                ADC   #$D5                           
212D- 69 D5                ADC   #$D5                           
212F- 69 D5                ADC   #$D5                           
2131- 69 D5                ADC   #$D5                           
2133- 69 D5                ADC   #$D5                           
2135- 69 D5                ADC   #$D5                           
2137- 69 D5                ADC   #$D5                           
2139- 69 D5                ADC   #$D5                           
213B- 69 D5     L213B      ADC   #$D5                           
213D- 57 D5                ???   $D5                            
213F- A8                   TAY                                  
2140- DB B8 DB             ???   $DBB8,Y                        
2143- 9A                   TXS                                  
2144- D5 C4                CMP   $C4,X                          
2146- D6 74                DEC   $74,X                          
2148- D5 AA                CMP   $AA,X                          
214A- D5 B8                CMP   $B8,X                          
214C- D5 EF                CMP   $EF,X                          
214E- 00                   BRK                                  
214F- E8                   INX                                  
2150- D9 06 D5             CMP   $D506,Y                        
2153- 44 D4                ???   $D4                            
2155- 12 D5                ORA   ($D5)                          
2157- 21 D5                AND   ($D5,X)                        
2159- 30 D5                BMI   L2130                          
215B- 3E D5 BA             ROL   $BAD5,X                        
215E- DA                   PHX                                  
215F- CF DA                ???   L213B                          
2161- 04 DB                TSB   $DB                            
2163- 16 DB                ASL   $DB,X                          
2165- E4 DA                CPX   $DA                            
2167- F6 DA                INC   $DA,X                          
2169- D6 DB                DEC   $DB,X                          
216B- C8                   INY                                  
216C- DB DD DB             ???   $DBDD,Y                        
216F- 24 DB                BIT   $DB                            
2171- 6B                   ???                                  
2172- DC C0 DC             ???   $DCC0                          
2175- 49 DD                EOR   #$DD                           
2177- 98                   TYA                                  
2178- DD AC DD             CMP   $DDAC,X                        
217B- 81 D5                STA   ($D5,X)                        
217D- 53                   ???                                  
217E- D6 62                DEC   $62,X                          
2180- D6 D8                DEC   $D8,X                          
2182- D6 EC                DEC   $EC,X                          
2184- D6 2C                DEC   $2C,X                          
2186- D8                   CLD                                  
2187- 42 D8                ???   $D8                            
2189- 22 DA                ???   $DA                            
218B- 35 DA                AND   $DA,X                          
218D- C4 D9                CPY   $D9                            
218F- D0 D9                BNE   L216A                          
2191- EC D9 FD             CPX   $FDD9                          
2194- D9 55 DA             CMP   $DA55,Y                        
2197- 68                   PLA                                  
2198- DA                   PHX                                  
2199- 89 DA                BIT   #$DA                           
219B- 9E DA 48             STZ   $48DA,X                        
219E- D5 30                CMP   COLOR,X                        
21A0- D3                   ???                                  
21A1- 40                   RTI                                  
21A2- D3                   ???                                  
21A3- 63                   ???                                  
21A4- D3                   ???                                  
21A5- 28                   PLP                                  
21A6- D4 32                ???   $32                            
21A8- D4 5E     L21A8      ???   $5E                            
21AA- D4 6A                ???   $6A                            
21AC- D4 18                ???   $18                            
21AE- D4 7A                ???   $7A                            
21B0- D4 89                ???   $89                            
21B2- D4 98                ???   $98                            
21B4- D4 A7                ???   $A7                            
21B6- D4 B6                ???   $B6                            
21B8- D4 DA                ???   $DA                            
21BA- D4 50                ???   $50                            
21BC- D3                   ???                                  
21BD- FB                   ???                                  
21BE- DB 09 DC             ???   $DC09,Y                        
21C1- 33                   ???                                  
21C2- DC 5B DC             ???   $DC5B                          
21C5- 1B                   ???                                  
21C6- DC 4B DC             ???   $DC4B                          
21C9- 96 DB                STX   $DB,Y                          
21CB- 9F DB                ???   L21A8                          
21CD- 36 D7                ROL   $D7,X                          
21CF- 68                   PLA                                  
21D0- D7 9E                ???   $9E                            
21D2- D8                   CLD                                  
21D3- D4 D8                ???   $D8                            
21D5- A0 D7                LDY   #$D7                           
21D7- E0 D7                CPX   #$D7                           
21D9- 1C D9 68             TRB   $68D9                          
21DC- D9 AD DD             CMP   $DDAD,Y                        
21DF- BD DD CE             LDA   $CEDD,X                        
21E2- DD 68 18             CMP   $1868,X                        
21E5- 69 01                ADC   #$01                           
21E7- 85 F2                STA   $F2                            
21E9- 68                   PLA                                  
21EA- 69 00                ADC   #$00                           
21EC- 85 F3                STA   $F3                            
21EE- A0 00                LDY   #$00                           
21F0- A9 D0                LDA   #$D0                           
21F2- 85 F8                STA   $F8                            
21F4- 4C F1 00             JMP   $00F1                          
21F7- 68                   PLA                                  
21F8- 85 E7                STA   $E7                            
21FA- 68                   PLA                                  
21FB- 85 E8                STA   $E8                            
21FD- A0 02                LDY   #$02                           
21FF- B1 E7                LDA   ($E7),Y                        
2201- 85 F3                STA   $F3                            
2203- 88                   DEY                                  
2204- B1 E7                LDA   ($E7),Y                        
2206- 85 F2                STA   $F2                            
2208- 88                   DEY                                  
2209- A9 D2                LDA   #$D2                           
220B- 85 F8                STA   $F8                            
220D- 08                   PHP                                  
220E- 78                   SEI                                  
220F- 8D 03 C0             STA   SETRAMRD                       
2212- 4C F1 00             JMP   $00F1                          
2215- EA                   NOP                                  
2216- EA                   NOP                                  
2217- EA                   NOP                                  
2218- EA                   NOP                                  
2219- EA                   NOP                                  
221A- EA                   NOP                                  
221B- EA                   NOP                                  
221C- EA                   NOP                                  
221D- AC D0 10             LDY   $10D0                          
2220- B9 D0 10  L2220      LDA   $10D0,Y                        
2223- 99 00 03             STA   $0300,Y                        
2226- 88                   DEY                                  
2227- 10 F7                BPL   L2220                          
2229- 2C 82 C0             BIT   PHASE1OFF                      
222C- A0 04                LDY   #$04                           
222E- B9 A0 10  L222E      LDA   $10A0,Y                        
2231- 09 80                ORA   #$80                           
2233- 20 ED FD             JSR   COUT                           
2236- B9 A5 10             LDA   $10A5,Y                        
2239- 99 F0 02             STA   $02F0,Y                        
223C- 88                   DEY                                  
223D- 10 EF                BPL   L222E                          
223F- 2C 54 C0             BIT   PAGE2CLR                       
2242- 2C 51 C0             BIT   TXTSET                         
2245- 2C 5F C0             BIT   CLRAN3                         
2248- 20 58 FC             JSR   HOME                           
224B- A0 0F                LDY   #$0F                           
224D- B9 B4 10  L224D      LDA   $10B4,Y                        
2250- 99 EF 00             STA   $00EF,Y                        
2253- 88                   DEY                                  
2254- 10 F7                BPL   L224D                          
2256- A9 4C                LDA   #$4C                           
2258- 85 E6                STA   HPAG                           
225A- A0 12                LDY   #$12                           
225C- B9 BE 10  L225C      LDA   $10BE,Y                        
225F- 99 D0 03             STA   DOSWRM,Y                       
2262- 88                   DEY                                  
2263- 10 F7                BPL   L225C                          
2265- 20 00 BF             JSR   MLI                            
2268- CC 9E 10             CPY   $109E                          
226B- D0 2A                BNE   L2297                          
226D- 20 00 BF             JSR   MLI                            
2270- C8                   INY                                  
2271- 90 10                BCC   L2283                          
2273- D0 22                BNE   L2297                          
2275- AD 95 10             LDA   $1095                          
2278- 8D 97 10             STA   $1097                          
227B- 20 00 BF             JSR   MLI                            
227E- CA                   DEX                                  
227F- 96 10                STX   $10,Y                          
2281- D0 14                BNE   L2297                          
2283- 20 00 BF  L2283      JSR   MLI                            
2286- CC 9E 10             CPY   $109E                          
2289- D0 0C                BNE   L2297                          
228B- AD 00 03             LDA   $0300                          
228E- 38                   SEC                                  
228F- E9 07                SBC   #$07                           
2291- 8D 00 03             STA   $0300                          
2294- 4C 00 20             JMP   L2000                          
2297- EE F4 03  L2297      INC   $03F4                          
229A- A0 0B                LDY   #$0B                           
229C- B9 A8 10  L229C      LDA   $10A8,Y                        
229F- 09 80                ORA   #$80                           
22A1- 20 ED FD             JSR   COUT                           
22A4- 88                   DEY                                  
22A5- 10 F5                BPL   L229C                          
22A7- 20 0C FD             JSR   RDKEY                          
22AA- 6C FC FF             JMP   ($FFFC)                        
22AD- 03                   ???                                  
22AE- 00                   BRK                                  
22AF- 03                   ???                                  
22B0- 00                   BRK                                  
22B1- 08                   PHP                                  
22B2- 00                   BRK                                  
22B3- 04 00                TSB   $00                            
22B5- 00                   BRK                                  
22B6- 20 00 9F             JSR   $9F00                          
22B9- 00                   BRK                                  
22BA- 00                   BRK                                  
22BB- 01 00                ORA   ($00,X)                        
22BD- 15 0D                ORA   $0D,X                          
22BF- 31 1A                AND   ($1A),Y                        
22C1- 0D CA C9             ORA   $C9CA                          
22C4- 54 2E                ???   MASK                           
22C6- 44 4D                ???   $4D                            
22C8- 43                   ???                                  
22C9- 20 47 4E             JSR   $4E47                          
22CC- 49 53                EOR   #$53                           
22CE- 53                   ???                                  
22CF- 49 4D                EOR   #$4D                           
22D1- E8                   INX                                  
22D2- C8                   INY                                  
22D3- B9 FF FF             LDA   $FFFF,Y                        
22D6- 85 F7                STA   $F7                            
22D8- 6C 00 D0             JMP   ($D000)                        
22DB- 2C 80 C0             BIT   PHASEOFF                       
22DE- 4C C6 D0             JMP   $D0C6                          
22E1- 2C 80 C0             BIT   PHASEOFF                       
22E4- 4C C6 D2             JMP   $D2C6                          
22E7- 2C 80 C0             BIT   PHASEOFF                       
22EA- 4C DA D0             JMP   $D0DA                          
22ED- EA                   NOP                                  
22EE- EA                   NOP                                  
22EF- EA                   NOP                                  
22F0- EA                   NOP                                  
22F1- EA                   NOP                                  
22F2- EA                   NOP                                  
22F3- EA                   NOP                                  
22F4- EA                   NOP                                  
22F5- EA                   NOP                                  
22F6- EA                   NOP                                  
22F7- EA                   NOP                                  
22F8- EA                   NOP                                  
22F9- EA                   NOP                                  
22FA- EA                   NOP                                  
22FB- EA                   NOP                                  
22FC- EA                   NOP                                  
22FD- EA                   NOP                                  
22FE- EA                   NOP                                  
22FF- EA                   NOP                                  
2300- EA                   NOP                                  
2301- EA                   NOP                                  
2302- EA                   NOP                                  
2303- EA                   NOP                                  
2304- EA                   NOP                                  
2305- EA                   NOP                                  
2306- EA                   NOP                                  
2307- EA                   NOP                                  
2308- EA                   NOP                                  
2309- EA                   NOP                                  
230A- EA                   NOP                                  
230B- EA                   NOP                                  
230C- EA                   NOP                                  
230D- EA                   NOP                                  
230E- EA                   NOP                                  
230F- EA                   NOP                                  
2310- EA                   NOP                                  
2311- EA                   NOP                                  
2312- EA                   NOP                                  
2313- EA                   NOP                                  
2314- EA                   NOP                                  
2315- EA                   NOP                                  
2316- EA                   NOP                                  
2317- EA                   NOP                                  
2318- EA                   NOP                                  
2319- EA                   NOP                                  
231A- EA                   NOP                                  
231B- EA                   NOP                                  
231C- EA                   NOP                                  
231D- 61 D5                ADC   ($D5,X)                        
231F- 69 D5                ADC   #$D5                           
2321- 69 D5                ADC   #$D5                           
2323- 69 D5                ADC   #$D5                           
2325- 69 D5                ADC   #$D5                           
2327- 69 D5                ADC   #$D5                           
2329- 69 D5                ADC   #$D5                           
232B- 69 D5                ADC   #$D5                           
232D- 69 D5                ADC   #$D5                           
232F- 69 D5                ADC   #$D5                           
2331- 69 D5                ADC   #$D5                           
2333- 69 D5                ADC   #$D5                           
2335- 69 D5                ADC   #$D5                           
2337- 69 D5                ADC   #$D5                           
2339- 69 D5                ADC   #$D5                           
233B- 69 D5     L233B      ADC   #$D5                           
233D- 57 D5                ???   $D5                            
233F- A8                   TAY                                  
2340- DB B8 DB             ???   $DBB8,Y                        
2343- 9A                   TXS                                  
2344- D5 C4                CMP   $C4,X                          
2346- D6 74                DEC   $74,X                          
2348- D5 AA                CMP   $AA,X                          
234A- D5 D0                CMP   $D0,X                          
234C- D5 EF                CMP   $EF,X                          
234E- 00                   BRK                                  
234F- E8                   INX                                  
2350- D9 06 D5             CMP   $D506,Y                        
2353- 44 D4                ???   $D4                            
2355- 12 D5                ORA   ($D5)                          
2357- 21 D5                AND   ($D5,X)                        
2359- 30 D5                BMI   L2330                          
235B- 3E D5 BA             ROL   $BAD5,X                        
235E- DA                   PHX                                  
235F- CF DA                ???   L233B                          
2361- 04 DB                TSB   $DB                            
2363- 16 DB                ASL   $DB,X                          
2365- E4 DA                CPX   $DA                            
2367- F6 DA                INC   $DA,X                          
2369- D6 DB                DEC   $DB,X                          
236B- C8                   INY                                  
236C- DB DD DB             ???   $DBDD,Y                        
236F- 24 DB                BIT   $DB                            
2371- 91 DC                STA   ($DC),Y                        
2373- E5 DC                SBC   $DC                            
2375- 13                   ???                                  
2376- DD 7A DD             CMP   $DD7A,X                        
2379- 93                   ???                                  
237A- DD 81 D5             CMP   $D581,X                        
237D- 7E D6 93             ROR   $93D6,X                        
2380- D6 01                DEC   $01,X                          
2382- D7 1B                ???   $1B                            
2384- D7 5F                ???   $5F                            
2386- D8                   CLD                                  
2387- 7B                   ???                                  
2388- D8                   CLD                                  
2389- 22 DA                ???   $DA                            
238B- 35 DA                AND   $DA,X                          
238D- C4 D9                CPY   $D9                            
238F- D0 D9                BNE   L236A                          
2391- EC D9 FD             CPX   $FDD9                          
2394- D9 55 DA             CMP   $DA55,Y                        
2397- 68                   PLA                                  
2398- DA                   PHX                                  
2399- 89 DA                BIT   #$DA                           
239B- 9E DA 48             STZ   $48DA,X                        
239E- D5 30                CMP   COLOR,X                        
23A0- D3                   ???                                  
23A1- 40                   RTI                                  
23A2- D3                   ???                                  
23A3- 63                   ???                                  
23A4- D3                   ???                                  
23A5- 28                   PLP                                  
23A6- D4 32                ???   $32                            
23A8- D4 5E     L23A8      ???   $5E                            
23AA- D4 6A                ???   $6A                            
23AC- D4 18                ???   $18                            
23AE- D4 7A                ???   $7A                            
23B0- D4 89                ???   $89                            
23B2- D4 98                ???   $98                            
23B4- D4 A7     L23B4      ???   $A7                            
23B6- D4 B6                ???   $B6                            
23B8- D4 DA                ???   $DA                            
23BA- D4 50                ???   $50                            
23BC- D3                   ???                                  
23BD- FB                   ???                                  
23BE- DB 09 DC             ???   $DC09,Y                        
23C1- 33                   ???                                  
23C2- DC 5B DC             ???   $DC5B                          
23C5- 1B                   ???                                  
23C6- DC 4B DC             ???   $DC4B                          
23C9- 96 DB                STX   $DB,Y                          
23CB- 9F DB                ???   L23A8                          
23CD- 4C D7 81             JMP   $81D7                          
23D0- D7 B6                ???   $B6                            
23D2- D8                   CLD                                  
23D3- F5 D8                SBC   $D8,X                          
23D5- BD D7 03             LDA   $03D7,X                        
23D8- D8                   CLD                                  
23D9- 3F D9                ???   L23B4                          
23DB- 93                   ???                                  
23DC- D9 AD DD             CMP   $DDAD,Y                        
23DF- BD DD CE             LDA   $CEDD,X                        
23E2- DD 68 38             CMP   $3868,X                        
23E5- E9 02                SBC   #$02                           
23E7- 85 E7                STA   $E7                            
23E9- 68                   PLA                                  
23EA- E9 00                SBC   #$00                           
23EC- 85 E8                STA   $E8                            
23EE- A0 05                LDY   #$05                           
23F0- B1 E7                LDA   ($E7),Y                        
23F2- 38                   SEC                                  
23F3- E9 01                SBC   #$01                           
23F5- 91 E7                STA   ($E7),Y                        
23F7- F0 18                BEQ   L2411                          
23F9- 88                   DEY                                  
23FA- B1 E7                LDA   ($E7),Y                        
23FC- 85 F3                STA   $F3                            
23FE- 88                   DEY                                  
23FF- B1 E7                LDA   ($E7),Y                        
2401- 85 F2                STA   $F2                            
2403- A0 00                LDY   #$00                           
2405- A9 D2                LDA   #$D2                           
2407- 85 F8                STA   $F8                            
2409- 08                   PHP                                  
240A- 78                   SEI                                  
240B- 8D 03 C0             STA   SETRAMRD                       
240E- 4C F1 00             JMP   $00F1                          
2411- AD E2 03  L2411      LDA   $03E2                          
2414- 85 06                STA   $06                            
2416- AD E3 03             LDA   LOCRPL                         
2419- 85 07                STA   $07                            
241B- 88                   DEY                                  
241C- B1 06                LDA   ($06),Y                        
241E- 85 F3                STA   $F3                            
2420- 88                   DEY                                  
2421- B1 06                LDA   ($06),Y                        
2423- 85 F2                STA   $F2                            
2425- CA                   DEX                                  
2426- A5 E7                LDA   $E7                            
2428- 48                   PHA                                  
2429- 95 C0                STA   $C0,X                          
242B- A5 E8                LDA   $E8                            
242D- 48                   PHA                                  
242E- 95 A0                STA   $A0,X                          
2430- A0 00                LDY   #$00                           
2432- A9 D2                LDA   #$D2                           
2434- 85 F8                STA   $F8                            
2436- A9 D3                LDA   #$D3                           
2438- 48                   PHA                                  
2439- A9 26                LDA   #$26                           
243B- 48                   PHA                                  
243C- 08                   PHP                                  
243D- 78                   SEI                                  
243E- 8D 03 C0             STA   SETRAMRD                       
2441- 4C F1 00             JMP   $00F1                          
2444- 68                   PLA                                  
2445- 85 E8                STA   $E8                            
2447- 68                   PLA                                  
2448- 85 E7                STA   $E7                            
244A- 6C E7 00             JMP   ($00E7)                        
244D- B5 C0                LDA   $C0,X                          
244F- 18                   CLC                                  
2450- 75 C1                ADC   $C1,X                          
2452- 95 C1                STA   $C1,X                          
2454- B5 A0                LDA   $A0,X                          
2456- 75 A1                ADC   $A1,X                          
2458- 95 A1                STA   $A1,X                          
245A- 4C EF 00             JMP   $00EF                          
245D- B5 C1                LDA   $C1,X                          
245F- 38                   SEC                                  
2460- F5 C0                SBC   $C0,X                          
2462- 95 C1                STA   $C1,X                          
2464- B5 A1                LDA   $A1,X                          
2466- F5 A0                SBC   $A0,X                          
2468- 95 A1                STA   $A1,X                          
246A- 4C EF 00             JMP   $00EF                          
246D- B5 C0                LDA   $C0,X                          
246F- 0A                   ASL                                  
2470- 36 A0                ROL   $A0,X                          
2472- 18                   CLC                                  
2473- 75 C1                ADC   $C1,X                          
2475- 95 C1                STA   $C1,X                          
2477- B5 A0                LDA   $A0,X                          
2479- 75 A1                ADC   $A1,X                          
247B- 95 A1                STA   $A1,X                          
247D- 4C EF 00             JMP   $00EF                          
2480- 84 E4                STY   $E4                            
2482- B5 A0                LDA   $A0,X                          
2484- D5 A1                CMP   $A1,X                          
2486- B0 0F                BCS   L2497                          
2488- A8                   TAY                                  
2489- B5 A1                LDA   $A1,X                          
248B- 95 A0                STA   $A0,X                          
248D- 94 A1                STY   $A1,X                          
248F- B4 C0                LDY   $C0,X                          
2491- B5 C1                LDA   $C1,X                          
2493- 95 C0                STA   $C0,X                          
2495- 94 C1                STY   $C1,X                          
2497- B5 C1     L2497      LDA   $C1,X                          
2499- 49 FF                EOR   #$FF                           
249B- 85 E7                STA   $E7                            
249D- A9 00                LDA   #$00                           
249F- 95 C1                STA   $C1,X                          
24A1- A0 08                LDY   #$08                           
24A3- 46 E7     L24A3      LSR   $E7                            
24A5- B0 0C                BCS   L24B3                          
24A7- 85 E8                STA   $E8                            
24A9- B5 C1                LDA   $C1,X                          
24AB- 75 C0                ADC   $C0,X                          
24AD- 95 C1                STA   $C1,X                          
24AF- A5 E8                LDA   $E8                            
24B1- 75 A0                ADC   $A0,X                          
24B3- 16 C0     L24B3      ASL   $C0,X                          
24B5- 36 A0                ROL   $A0,X                          
24B7- 88                   DEY                                  
24B8- D0 E9                BNE   L24A3                          
24BA- F0 0F                BEQ   L24CB                          
24BC- 18        L24BC      CLC                                  
24BD- A8                   TAY                                  
24BE- B5 C1                LDA   $C1,X                          
24C0- 75 C0                ADC   $C0,X                          
24C2- 95 C1                STA   $C1,X                          
24C4- 98                   TYA                                  
24C5- 75 A0                ADC   $A0,X                          
24C7- 16 C0     L24C7      ASL   $C0,X                          
24C9- 36 A0                ROL   $A0,X                          
24CB- 56 A1     L24CB      LSR   $A1,X                          
24CD- B0 ED                BCS   L24BC                          
24CF- D0 F6                BNE   L24C7                          
24D1- 95 A1                STA   $A1,X                          
24D3- A4 E4                LDY   $E4                            
24D5- 4C EF 00             JMP   $00EF                          
24D8- A9 00                LDA   #$00                           
24DA- 38                   SEC                                  
24DB- F5 C0                SBC   $C0,X                          
24DD- 95 C0                STA   $C0,X                          
24DF- A9 00                LDA   #$00                           
24E1- F5 A0                SBC   $A0,X                          
24E3- 95 A0                STA   $A0,X                          
24E5- 60                   RTS                                  
24E6- 84 E4                STY   $E4                            
24E8- A0 11                LDY   #$11                           
24EA- A9 00                LDA   #$00                           
24EC- 85 E7                STA   $E7                            
24EE- 85 E8                STA   $E8                            
24F0- 85 E9                STA   $E9                            
24F2- B5 A1                LDA   $A1,X                          
24F4- 10 09                BPL   L24FF                          
24F6- E8                   INX                                  
24F7- 20 BB D3             JSR   $D3BB                          
24FA- CA                   DEX                                  
24FB- A9 81                LDA   #$81                           
24FD- 85 E9                STA   $E9                            
24FF- 15 C1     L24FF      ORA   $C1,X                          
2501- F0 2E                BEQ   L2531                          
2503- B5 A0                LDA   $A0,X                          
2505- 10 05                BPL   L250C                          
2507- 20 BB D3             JSR   $D3BB                          
250A- E6 E9                INC   $E9                            
250C- 16 C1     L250C      ASL   $C1,X                          
250E- 36 A1                ROL   $A1,X                          
2510- 88                   DEY                                  
2511- 90 F9                BCC   L250C                          
2513- 26 E7     L2513      ROL   $E7                            
2515- 26 E8                ROL   $E8                            
2517- A5 E7                LDA   $E7                            
2519- D5 C0                CMP   $C0,X                          
251B- A5 E8                LDA   $E8                            
251D- F5 A0                SBC   $A0,X                          
251F- 90 09                BCC   L252A                          
2521- 85 E8                STA   $E8                            
2523- A5 E7                LDA   $E7                            
2525- F5 C0                SBC   $C0,X                          
2527- 85 E7                STA   $E7                            
2529- 38                   SEC                                  
252A- 36 C1     L252A      ROL   $C1,X                          
252C- 36 A1                ROL   $A1,X                          
252E- 88                   DEY                                  
252F- D0 E2                BNE   L2513                          
2531- E8        L2531      INX                                  
2532- A4 E4                LDY   $E4                            
2534- 60                   RTS                                  
2535- A9 00     L2535      LDA   #$00                           
2537- 38                   SEC                                  
2538- F5 C0                SBC   $C0,X                          
253A- 95 C0                STA   $C0,X                          
253C- A9 00                LDA   #$00                           
253E- F5 A0                SBC   $A0,X                          
2540- 95 A0                STA   $A0,X                          
2542- 4C F0 00             JMP   $00F0                          
2545- 20 C9 D3             JSR   $D3C9                          
2548- 46 E9                LSR   $E9                            
254A- B0 E9                BCS   L2535                          
254C- 4C F0 00             JMP   $00F0                          
254F- 20 C9 D3             JSR   $D3C9                          
2552- A5 E7                LDA   $E7                            
2554- 95 C0                STA   $C0,X                          
2556- A5 E8                LDA   $E8                            
2558- 95 A0                STA   $A0,X                          
255A- A5 E9                LDA   $E9                            
255C- 30 D7                BMI   L2535                          
255E- 4C F0 00             JMP   $00F0                          
2561- 20 C9 D3             JSR   $D3C9                          
2564- 46 E9                LSR   $E9                            
2566- 90 03                BCC   L256B                          
2568- 20 BB D3             JSR   $D3BB                          
256B- CA        L256B      DEX                                  
256C- A5 E7                LDA   $E7                            
256E- 95 C0                STA   $C0,X                          
2570- A5 E8                LDA   $E8                            
2572- 95 A0                STA   $A0,X                          
2574- 06 E9                ASL   $E9                            
2576- 30 BD                BMI   L2535                          
2578- 4C F0 00             JMP   $00F0                          
257B- F6 C0                INC   $C0,X                          
257D- F0 03                BEQ   L2582                          
257F- 4C F0 00             JMP   $00F0                          
2582- F6 A0     L2582      INC   $A0,X                          
2584- 4C F0 00             JMP   $00F0                          
2587- B5 C0                LDA   $C0,X                          
2589- F0 05                BEQ   L2590                          
258B- D6 C0                DEC   $C0,X                          
258D- 4C F0 00             JMP   $00F0                          
2590- D6 C0     L2590      DEC   $C0,X                          
2592- D6 A0                DEC   $A0,X                          
2594- 4C F0 00             JMP   $00F0                          
2597- A9 FF                LDA   #$FF                           
2599- 55 C0                EOR   $C0,X                          
259B- 95 C0                STA   $C0,X                          
259D- A9 FF                LDA   #$FF                           
259F- 55 A0                EOR   $A0,X                          
25A1- 95 A0                STA   $A0,X                          
25A3- 4C F0 00             JMP   $00F0                          
25A6- B5 C1                LDA   $C1,X                          
25A8- 35 C0                AND   $C0,X                          
25AA- 95 C1                STA   $C1,X                          
25AC- B5 A1                LDA   $A1,X                          
25AE- 35 A0                AND   $A0,X                          
25B0- 95 A1                STA   $A1,X                          
25B2- 4C EF 00             JMP   $00EF                          
25B5- B5 C1                LDA   $C1,X                          
25B7- 15 C0                ORA   $C0,X                          
25B9- 95 C1                STA   $C1,X                          
25BB- B5 A1                LDA   $A1,X                          
25BD- 15 A0                ORA   $A0,X                          
25BF- 95 A1                STA   $A1,X                          
25C1- 4C EF 00             JMP   $00EF                          
25C4- B5 C1                LDA   $C1,X                          
25C6- 55 C0                EOR   $C0,X                          
25C8- 95 C1                STA   $C1,X                          
25CA- B5 A1                LDA   $A1,X                          
25CC- 55 A0                EOR   $A0,X                          
25CE- 95 A1                STA   $A1,X                          
25D0- 4C EF 00             JMP   $00EF                          
25D3- 84 E4                STY   $E4                            
25D5- B5 C0                LDA   $C0,X                          
25D7- C9 08                CMP   #$08                           
25D9- 90 0A                BCC   L25E5                          
25DB- B4 C1                LDY   $C1,X                          
25DD- 94 A1                STY   $A1,X                          
25DF- A0 00                LDY   #$00                           
25E1- 94 C1                STY   $C1,X                          
25E3- E9 08                SBC   #$08                           
25E5- A8        L25E5      TAY                                  
25E6- F0 0A                BEQ   L25F2                          
25E8- B5 C1                LDA   $C1,X                          
25EA- 0A        L25EA      ASL                                  
25EB- 36 A1                ROL   $A1,X                          
25ED- 88                   DEY                                  
25EE- D0 FA                BNE   L25EA                          
25F0- 95 C1                STA   $C1,X                          
25F2- A4 E4     L25F2      LDY   $E4                            
25F4- 4C EF 00             JMP   $00EF                          
25F7- 84 E4                STY   $E4                            
25F9- B5 C0                LDA   $C0,X                          
25FB- C9 08                CMP   #$08                           
25FD- 90 10                BCC   L260F                          
25FF- B4 A1                LDY   $A1,X                          
2601- 94 C1                STY   $C1,X                          
2603- C0 80                CPY   #$80                           
2605- A0 00                LDY   #$00                           
2607- 90 01                BCC   L260A                          
2609- 88                   DEY                                  
260A- 94 A1     L260A      STY   $A1,X                          
260C- 38                   SEC                                  
260D- E9 08                SBC   #$08                           
260F- A8        L260F      TAY                                  
2610- F0 0C                BEQ   L261E                          
2612- B5 A1                LDA   $A1,X                          
2614- C9 80     L2614      CMP   #$80                           
2616- 6A                   ROR                                  
2617- 76 C1                ROR   $C1,X                          
2619- 88                   DEY                                  
261A- D0 F8                BNE   L2614                          
261C- 95 A1                STA   $A1,X                          
261E- A4 E4     L261E      LDY   $E4                            
2620- 4C EF 00             JMP   $00EF                          
2623- CA                   DEX                                  
2624- B5 C1                LDA   $C1,X                          
2626- 95 C0                STA   $C0,X                          
2628- B5 A1                LDA   $A1,X                          
262A- 95 A0                STA   $A0,X                          
262C- 4C F0 00             JMP   $00F0                          
262F- C8                   INY                                  
2630- B1 F2                LDA   ($F2),Y                        
2632- 18                   CLC                                  
2633- 75 C0                ADC   $C0,X                          
2635- 95 C0                STA   $C0,X                          
2637- 90 02                BCC   L263B                          
2639- F6 A0                INC   $A0,X                          
263B- 4C F0 00  L263B      JMP   $00F0                          
263E- C8                   INY                                  
263F- B5 C0                LDA   $C0,X                          
2641- 38                   SEC                                  
2642- F1 F2                SBC   ($F2),Y                        
2644- 95 C0                STA   $C0,X                          
2646- B0 02                BCS   L264A                          
2648- D6 A0                DEC   $A0,X                          
264A- 4C F0 00  L264A      JMP   $00F0                          
264D- C8                   INY                                  
264E- B1 F2                LDA   ($F2),Y                        
2650- 35 C0                AND   $C0,X                          
2652- 95 C0                STA   $C0,X                          
2654- A9 00                LDA   #$00                           
2656- 95 A0                STA   $A0,X                          
2658- 4C F0 00             JMP   $00F0                          
265B- C8                   INY                                  
265C- B1 F2                LDA   ($F2),Y                        
265E- 15 C0                ORA   $C0,X                          
2660- 95 C0                STA   $C0,X                          
2662- 4C F0 00             JMP   $00F0                          
2665- B5 C0                LDA   $C0,X                          
2667- 15 A0                ORA   $A0,X                          
2669- F0 0A                BEQ   L2675                          
266B- A9 00                LDA   #$00                           
266D- 95 C0                STA   $C0,X                          
266F- 95 A0                STA   $A0,X                          
2671- 4C F0 00             JMP   $00F0                          
2674- CA                   DEX                                  
2675- A9 FF     L2675      LDA   #$FF                           
2677- 95 C0                STA   $C0,X                          
2679- 95 A0                STA   $A0,X                          
267B- 4C F0 00             JMP   $00F0                          
267E- CA                   DEX                                  
267F- 95 C0                STA   $C0,X                          
2681- 95 A0                STA   $A0,X                          
2683- 4C F0 00             JMP   $00F0                          
2686- CA                   DEX                                  
2687- 4A                   LSR                                  
2688- 95 C0                STA   $C0,X                          
268A- A9 00                LDA   #$00                           
268C- 95 A0                STA   $A0,X                          
268E- 4C F0 00             JMP   $00F0                          
2691- CA                   DEX                                  
2692- A9 00                LDA   #$00                           
2694- 95 A0                STA   $A0,X                          
2696- C8                   INY                                  
2697- B1 F2                LDA   ($F2),Y                        
2699- 95 C0                STA   $C0,X                          
269B- 4C F0 00             JMP   $00F0                          
269E- CA                   DEX                                  
269F- A9 FF                LDA   #$FF                           
26A1- 95 A0                STA   $A0,X                          
26A3- C8                   INY                                  
26A4- B1 F2                LDA   ($F2),Y                        
26A6- 95 C0                STA   $C0,X                          
26A8- 4C F0 00             JMP   $00F0                          
26AB- 98        L26AB      TYA                                  
26AC- 18                   CLC                                  
26AD- 65 F2                ADC   $F2                            
26AF- 85 F2                STA   $F2                            
26B1- 90 02                BCC   L26B5                          
26B3- E6 F3                INC   $F3                            
26B5- A0 FF     L26B5      LDY   #$FF                           
26B7- C8                   INY                                  
26B8- 30 F1                BMI   L26AB                          
26BA- CA                   DEX                                  
26BB- B1 F2                LDA   ($F2),Y                        
26BD- 95 C0                STA   $C0,X                          
26BF- C8                   INY                                  
26C0- B1 F2                LDA   ($F2),Y                        
26C2- 95 A0                STA   $A0,X                          
26C4- 4C F0 00             JMP   $00F0                          
26C7- CA                   DEX                                  
26C8- C8                   INY                                  
26C9- B1 F2                LDA   ($F2),Y                        
26CB- 95 C0                STA   $C0,X                          
26CD- C8                   INY                                  
26CE- B1 F2                LDA   ($F2),Y                        
26D0- 95 A0                STA   $A0,X                          
26D2- 4C F0 00             JMP   $00F0                          
26D5- CA                   DEX                                  
26D6- 98                   TYA                                  
26D7- 38                   SEC                                  
26D8- 65 F2                ADC   $F2                            
26DA- 85 F2                STA   $F2                            
26DC- 95 C0                STA   $C0,X                          
26DE- A9 00                LDA   #$00                           
26E0- A8                   TAY                                  
26E1- 65 F3                ADC   $F3                            
26E3- 85 F3                STA   $F3                            
26E5- 95 A0                STA   $A0,X                          
26E7- B1 F2                LDA   ($F2),Y                        
26E9- A8                   TAY                                  
26EA- 4C F0 00             JMP   $00F0                          
26ED- CA                   DEX                                  
26EE- 98                   TYA                                  
26EF- 38                   SEC                                  
26F0- 65 F2                ADC   $F2                            
26F2- 85 F2                STA   $F2                            
26F4- A9 00                LDA   #$00                           
26F6- A8                   TAY                                  
26F7- 65 F3                ADC   $F3                            
26F9- 85 F3                STA   $F3                            
26FB- A5 E2                LDA   YO                             
26FD- 85 E7                STA   $E7                            
26FF- A5 E3                LDA   $E3                            
2701- 85 E8                STA   $E8                            
2703- C5 E1     L2703      CMP   $E1                            
2705- 90 08                BCC   L270F                          
2707- D0 43                BNE   L274C                          
2709- A5 E7                LDA   $E7                            
270B- C5 E0                CMP   XO                             
270D- B0 3D                BCS   L274C                          
270F- 8D 02 C0  L270F      STA   CLRRAMRD                       
2712- B1 E7                LDA   ($E7),Y                        
2714- 8D 03 C0             STA   SETRAMRD                       
2717- D1 F2                CMP   ($F2),Y                        
2719- D0 24                BNE   L273F                          
271B- A8                   TAY                                  
271C- 8D 02 C0  L271C      STA   CLRRAMRD                       
271F- B1 E7                LDA   ($E7),Y                        
2721- 8D 03 C0             STA   SETRAMRD                       
2724- D1 F2                CMP   ($F2),Y                        
2726- D0 0D                BNE   L2735                          
2728- 88                   DEY                                  
2729- D0 F1                BNE   L271C                          
272B- A5 E7                LDA   $E7                            
272D- 95 C0                STA   $C0,X                          
272F- A5 E8                LDA   $E8                            
2731- 95 A0                STA   $A0,X                          
2733- D0 35                BNE   L276A                          
2735- A0 00     L2735      LDY   #$00                           
2737- 8D 02 C0             STA   CLRRAMRD                       
273A- B1 E7                LDA   ($E7),Y                        
273C- 8D 03 C0             STA   SETRAMRD                       
273F- 38        L273F      SEC                                  
2740- 65 E7                ADC   $E7                            
2742- 85 E7                STA   $E7                            
2744- A9 00                LDA   #$00                           
2746- 65 E8                ADC   $E8                            
2748- 85 E8                STA   $E8                            
274A- D0 B7                BNE   L2703                          
274C- B1 F2     L274C      LDA   ($F2),Y                        
274E- A8                   TAY                                  
274F- 49 FF                EOR   #$FF                           
2751- 18                   CLC                                  
2752- 65 E2                ADC   YO                             
2754- 85 E2                STA   YO                             
2756- 95 C0                STA   $C0,X                          
2758- A9 FF                LDA   #$FF                           
275A- 65 E3                ADC   $E3                            
275C- 85 E3                STA   $E3                            
275E- 95 A0                STA   $A0,X                          
2760- B1 F2     L2760      LDA   ($F2),Y                        
2762- 91 E2                STA   (YO),Y                         
2764- 88                   DEY                                  
2765- C0 FF                CPY   #$FF                           
2767- D0 F7                BNE   L2760                          
2769- C8                   INY                                  
276A- B1 F2     L276A      LDA   ($F2),Y                        
276C- A8                   TAY                                  
276D- 4C F0 00             JMP   $00F0                          
2770- B5 C0                LDA   $C0,X                          
2772- 95 9F                STA   $9F,X                          
2774- A1 9F                LDA   ($9F,X)                        
2776- 95 C0                STA   $C0,X                          
2778- A9 00                LDA   #$00                           
277A- 95 A0                STA   $A0,X                          
277C- 4C F0 00             JMP   $00F0                          
277F- B5 C0                LDA   $C0,X                          
2781- 95 9F                STA   $9F,X                          
2783- A1 9F                LDA   ($9F,X)                        
2785- 95 C0                STA   $C0,X                          
2787- F6 9F                INC   $9F,X                          
2789- F0 07                BEQ   L2792                          
278B- A1 9F                LDA   ($9F,X)                        
278D- 95 A0                STA   $A0,X                          
278F- 4C F0 00             JMP   $00F0                          
2792- F6 A0     L2792      INC   $A0,X                          
2794- A1 9F                LDA   ($9F,X)                        
2796- 95 A0                STA   $A0,X                          
2798- 4C F0 00             JMP   $00F0                          
279B- B5 C0                LDA   $C0,X                          
279D- 95 9F                STA   $9F,X                          
279F- 8D 02 C0             STA   CLRRAMRD                       
27A2- A1 9F                LDA   ($9F,X)                        
27A4- 95 C0                STA   $C0,X                          
27A6- A9 00                LDA   #$00                           
27A8- 95 A0                STA   $A0,X                          
27AA- 8D 03 C0             STA   SETRAMRD                       
27AD- 4C F0 00             JMP   $00F0                          
27B0- B5 C0                LDA   $C0,X                          
27B2- 95 9F                STA   $9F,X                          
27B4- 8D 02 C0             STA   CLRRAMRD                       
27B7- A1 9F                LDA   ($9F,X)                        
27B9- 95 C0                STA   $C0,X                          
27BB- F6 9F                INC   $9F,X                          
27BD- F0 0A                BEQ   L27C9                          
27BF- A1 9F                LDA   ($9F,X)                        
27C1- 95 A0                STA   $A0,X                          
27C3- 8D 03 C0             STA   SETRAMRD                       
27C6- 4C F0 00             JMP   $00F0                          
27C9- F6 A0     L27C9      INC   $A0,X                          
27CB- A1 9F                LDA   ($9F,X)                        
27CD- 95 A0                STA   $A0,X                          
27CF- 8D 03 C0             STA   SETRAMRD                       
27D2- 4C F0 00             JMP   $00F0                          
27D5- 98        L27D5      TYA                                  
27D6- 18                   CLC                                  
27D7- 65 F2                ADC   $F2                            
27D9- 85 F2                STA   $F2                            
27DB- 90 02                BCC   L27DF                          
27DD- E6 F3                INC   $F3                            
27DF- A0 FF     L27DF      LDY   #$FF                           
27E1- C8                   INY                                  
27E2- 30 F1                BMI   L27D5                          
27E4- B1 F2                LDA   ($F2),Y                        
27E6- CA                   DEX                                  
27E7- 18                   CLC                                  
27E8- 65 E0                ADC   XO                             
27EA- 95 C0                STA   $C0,X                          
27EC- A9 00                LDA   #$00                           
27EE- 65 E1                ADC   $E1                            
27F0- 95 A0                STA   $A0,X                          
27F2- 4C F0 00             JMP   $00F0                          
27F5- C8                   INY                                  
27F6- B1 F2                LDA   ($F2),Y                        
27F8- 84 E4                STY   $E4                            
27FA- A8                   TAY                                  
27FB- CA                   DEX                                  
27FC- B1 E0                LDA   (XO),Y                         
27FE- 95 C0                STA   $C0,X                          
2800- A9 00                LDA   #$00                           
2802- 95 A0                STA   $A0,X                          
2804- A4 E4                LDY   $E4                            
2806- 4C F0 00             JMP   $00F0                          
2809- C8                   INY                                  
280A- B1 F2                LDA   ($F2),Y                        
280C- 84 E4                STY   $E4                            
280E- A8                   TAY                                  
280F- CA                   DEX                                  
2810- B1 E0                LDA   (XO),Y                         
2812- 95 C0                STA   $C0,X                          
2814- C8                   INY                                  
2815- B1 E0                LDA   (XO),Y                         
2817- 95 A0                STA   $A0,X                          
2819- A4 E4                LDY   $E4                            
281B- 4C F0 00             JMP   $00F0                          
281E- C8                   INY                                  
281F- B1 F2                LDA   ($F2),Y                        
2821- 84 E4                STY   $E4                            
2823- A8                   TAY                                  
2824- CA                   DEX                                  
2825- 8D 02 C0             STA   CLRRAMRD                       
2828- B1 E0                LDA   (XO),Y                         
282A- 95 C0                STA   $C0,X                          
282C- A9 00                LDA   #$00                           
282E- 95 A0                STA   $A0,X                          
2830- 8D 03 C0             STA   SETRAMRD                       
2833- A4 E4                LDY   $E4                            
2835- 4C F0 00             JMP   $00F0                          
2838- C8                   INY                                  
2839- B1 F2                LDA   ($F2),Y                        
283B- 84 E4                STY   $E4                            
283D- A8                   TAY                                  
283E- CA                   DEX                                  
283F- 8D 02 C0             STA   CLRRAMRD                       
2842- B1 E0                LDA   (XO),Y                         
2844- 95 C0                STA   $C0,X                          
2846- C8                   INY                                  
2847- B1 E0                LDA   (XO),Y                         
2849- 95 A0                STA   $A0,X                          
284B- 8D 03 C0             STA   SETRAMRD                       
284E- A4 E4                LDY   $E4                            
2850- 4C F0 00             JMP   $00F0                          
2853- C8                   INY                                  
2854- B1 F2                LDA   ($F2),Y                        
2856- 84 E4                STY   $E4                            
2858- A8                   TAY                                  
2859- B1 E0                LDA   (XO),Y                         
285B- 18                   CLC                                  
285C- 75 C0                ADC   $C0,X                          
285E- 95 C0                STA   $C0,X                          
2860- 90 02                BCC   L2864                          
2862- F6 A0                INC   $A0,X                          
2864- A4 E4     L2864      LDY   $E4                            
2866- 4C F0 00             JMP   $00F0                          
2869- C8                   INY                                  
286A- B1 F2                LDA   ($F2),Y                        
286C- 84 E4                STY   $E4                            
286E- A8                   TAY                                  
286F- 8D 02 C0             STA   CLRRAMRD                       
2872- B1 E0                LDA   (XO),Y                         
2874- 18                   CLC                                  
2875- 75 C0                ADC   $C0,X                          
2877- 95 C0                STA   $C0,X                          
2879- 90 02                BCC   L287D                          
287B- F6 A0                INC   $A0,X                          
287D- 8D 03 C0  L287D      STA   SETRAMRD                       
2880- A4 E4                LDY   $E4                            
2882- 4C F0 00             JMP   $00F0                          
2885- C8                   INY                                  
2886- B1 F2                LDA   ($F2),Y                        
2888- 84 E4                STY   $E4                            
288A- A8                   TAY                                  
288B- B1 E0                LDA   (XO),Y                         
288D- 18                   CLC                                  
288E- 75 C0                ADC   $C0,X                          
2890- 95 C0                STA   $C0,X                          
2892- C8                   INY                                  
2893- B1 E0                LDA   (XO),Y                         
2895- 75 A0                ADC   $A0,X                          
2897- 95 A0                STA   $A0,X                          
2899- A4 E4                LDY   $E4                            
289B- 4C F0 00             JMP   $00F0                          
289E- C8                   INY                                  
289F- B1 F2                LDA   ($F2),Y                        
28A1- 84 E4                STY   $E4                            
28A3- A8                   TAY                                  
28A4- 8D 02 C0             STA   CLRRAMRD                       
28A7- B1 E0                LDA   (XO),Y                         
28A9- 18                   CLC                                  
28AA- 75 C0                ADC   $C0,X                          
28AC- 95 C0                STA   $C0,X                          
28AE- C8                   INY                                  
28AF- B1 E0                LDA   (XO),Y                         
28B1- 75 A0                ADC   $A0,X                          
28B3- 95 A0                STA   $A0,X                          
28B5- 8D 03 C0             STA   SETRAMRD                       
28B8- A4 E4                LDY   $E4                            
28BA- 4C F0 00             JMP   $00F0                          
28BD- C8                   INY                                  
28BE- B1 F2                LDA   ($F2),Y                        
28C0- 84 E4                STY   $E4                            
28C2- A8                   TAY                                  
28C3- B1 E0                LDA   (XO),Y                         
28C5- A0 00                LDY   #$00                           
28C7- 0A                   ASL                                  
28C8- 90 02                BCC   L28CC                          
28CA- C8                   INY                                  
28CB- 18                   CLC                                  
28CC- 75 C0     L28CC      ADC   $C0,X                          
28CE- 95 C0                STA   $C0,X                          
28D0- 98                   TYA                                  
28D1- 75 A0                ADC   $A0,X                          
28D3- 95 A0                STA   $A0,X                          
28D5- A4 E4                LDY   $E4                            
28D7- 4C F0 00             JMP   $00F0                          
28DA- C8                   INY                                  
28DB- B1 F2                LDA   ($F2),Y                        
28DD- 84 E4                STY   $E4                            
28DF- A8                   TAY                                  
28E0- 8D 02 C0             STA   CLRRAMRD                       
28E3- B1 E0                LDA   (XO),Y                         
28E5- A0 00                LDY   #$00                           
28E7- 0A                   ASL                                  
28E8- 90 02                BCC   L28EC                          
28EA- C8                   INY                                  
28EB- 18                   CLC                                  
28EC- 75 C0     L28EC      ADC   $C0,X                          
28EE- 95 C0                STA   $C0,X                          
28F0- 98                   TYA                                  
28F1- 75 A0                ADC   $A0,X                          
28F3- 95 A0                STA   $A0,X                          
28F5- 8D 03 C0             STA   SETRAMRD                       
28F8- A4 E4                LDY   $E4                            
28FA- 4C F0 00             JMP   $00F0                          
28FD- C8                   INY                                  
28FE- B1 F2                LDA   ($F2),Y                        
2900- 84 E4                STY   $E4                            
2902- A8                   TAY                                  
2903- B1 E0                LDA   (XO),Y                         
2905- 0A                   ASL                                  
2906- 85 E7                STA   $E7                            
2908- C8                   INY                                  
2909- B1 E0                LDA   (XO),Y                         
290B- 2A                   ROL                                  
290C- 85 E8                STA   $E8                            
290E- A5 E7                LDA   $E7                            
2910- 18                   CLC                                  
2911- 75 C0                ADC   $C0,X                          
2913- 95 C0                STA   $C0,X                          
2915- A5 E8                LDA   $E8                            
2917- 75 A0                ADC   $A0,X                          
2919- 95 A0                STA   $A0,X                          
291B- A4 E4                LDY   $E4                            
291D- 4C F0 00             JMP   $00F0                          
2920- C8                   INY                                  
2921- B1 F2                LDA   ($F2),Y                        
2923- 84 E4                STY   $E4                            
2925- A8                   TAY                                  
2926- 8D 02 C0             STA   CLRRAMRD                       
2929- B1 E0                LDA   (XO),Y                         
292B- 0A                   ASL                                  
292C- 85 E7                STA   $E7                            
292E- C8                   INY                                  
292F- B1 E0                LDA   (XO),Y                         
2931- 2A                   ROL                                  
2932- 85 E8                STA   $E8                            
2934- A5 E7                LDA   $E7                            
2936- 18                   CLC                                  
2937- 75 C0                ADC   $C0,X                          
2939- 95 C0                STA   $C0,X                          
293B- A5 E8                LDA   $E8                            
293D- 75 A0                ADC   $A0,X                          
293F- 95 A0                STA   $A0,X                          
2941- 8D 03 C0             STA   SETRAMRD                       
2944- A4 E4                LDY   $E4                            
2946- 4C F0 00             JMP   $00F0                          
2949- C8                   INY                                  
294A- B1 F2                LDA   ($F2),Y                        
294C- 95 9E                STA   $9E,X                          
294E- C8                   INY                                  
294F- B1 F2                LDA   ($F2),Y                        
2951- 95 9F                STA   $9F,X                          
2953- A1 9E                LDA   ($9E,X)                        
2955- CA                   DEX                                  
2956- 95 C0                STA   $C0,X                          
2958- A9 00                LDA   #$00                           
295A- 95 A0                STA   $A0,X                          
295C- 4C F0 00             JMP   $00F0                          
295F- C8                   INY                                  
2960- B1 F2                LDA   ($F2),Y                        
2962- 85 E7                STA   $E7                            
2964- C8                   INY                                  
2965- B1 F2                LDA   ($F2),Y                        
2967- 85 E8                STA   $E8                            
2969- 84 E4                STY   $E4                            
296B- A0 00                LDY   #$00                           
296D- B1 E7                LDA   ($E7),Y                        
296F- CA                   DEX                                  
2970- 95 C0                STA   $C0,X                          
2972- C8                   INY                                  
2973- B1 E7                LDA   ($E7),Y                        
2975- 95 A0                STA   $A0,X                          
2977- A4 E4                LDY   $E4                            
2979- 4C F0 00             JMP   $00F0                          
297C- C8                   INY                                  
297D- B1 F2                LDA   ($F2),Y                        
297F- 95 9E                STA   $9E,X                          
2981- C8                   INY                                  
2982- B1 F2                LDA   ($F2),Y                        
2984- 95 9F                STA   $9F,X                          
2986- 8D 02 C0             STA   CLRRAMRD                       
2989- A1 9E                LDA   ($9E,X)                        
298B- CA                   DEX                                  
298C- 95 C0                STA   $C0,X                          
298E- A9 00                LDA   #$00                           
2990- 95 A0                STA   $A0,X                          
2992- 8D 03 C0             STA   SETRAMRD                       
2995- 4C F0 00             JMP   $00F0                          
2998- C8                   INY                                  
2999- B1 F2                LDA   ($F2),Y                        
299B- 85 E7                STA   $E7                            
299D- C8                   INY                                  
299E- B1 F2                LDA   ($F2),Y                        
29A0- 85 E8                STA   $E8                            
29A2- 84 E4                STY   $E4                            
29A4- 8D 02 C0             STA   CLRRAMRD                       
29A7- A0 00                LDY   #$00                           
29A9- B1 E7                LDA   ($E7),Y                        
29AB- CA                   DEX                                  
29AC- 95 C0                STA   $C0,X                          
29AE- C8                   INY                                  
29AF- B1 E7                LDA   ($E7),Y                        
29B1- 95 A0                STA   $A0,X                          
29B3- 8D 03 C0             STA   SETRAMRD                       
29B6- A4 E4                LDY   $E4                            
29B8- 4C F0 00             JMP   $00F0                          
29BB- C8                   INY                                  
29BC- B1 F2                LDA   ($F2),Y                        
29BE- 95 9E                STA   $9E,X                          
29C0- C8                   INY                                  
29C1- B1 F2                LDA   ($F2),Y                        
29C3- 95 9F                STA   $9F,X                          
29C5- A1 9E                LDA   ($9E,X)                        
29C7- 18                   CLC                                  
29C8- 75 C0                ADC   $C0,X                          
29CA- 95 C0                STA   $C0,X                          
29CC- 90 02                BCC   L29D0                          
29CE- F6 A0                INC   $A0,X                          
29D0- 4C F0 00  L29D0      JMP   $00F0                          
29D3- C8                   INY                                  
29D4- B1 F2                LDA   ($F2),Y                        
29D6- 95 9E                STA   $9E,X                          
29D8- C8                   INY                                  
29D9- B1 F2                LDA   ($F2),Y                        
29DB- 95 9F                STA   $9F,X                          
29DD- 8D 02 C0             STA   CLRRAMRD                       
29E0- A1 9E                LDA   ($9E,X)                        
29E2- 18                   CLC                                  
29E3- 75 C0                ADC   $C0,X                          
29E5- 95 C0                STA   $C0,X                          
29E7- 90 02                BCC   L29EB                          
29E9- F6 A0                INC   $A0,X                          
29EB- 8D 03 C0  L29EB      STA   SETRAMRD                       
29EE- 4C F0 00             JMP   $00F0                          
29F1- C8                   INY                                  
29F2- B1 F2                LDA   ($F2),Y                        
29F4- 85 06                STA   $06                            
29F6- C8                   INY                                  
29F7- B1 F2                LDA   ($F2),Y                        
29F9- 85 07                STA   $07                            
29FB- 84 E4                STY   $E4                            
29FD- A0 00                LDY   #$00                           
29FF- B1 06                LDA   ($06),Y                        
2A01- 18                   CLC                                  
2A02- 75 C0                ADC   $C0,X                          
2A04- 95 C0                STA   $C0,X                          
2A06- C8                   INY                                  
2A07- B1 06                LDA   ($06),Y                        
2A09- 75 A0                ADC   $A0,X                          
2A0B- 95 A0                STA   $A0,X                          
2A0D- A4 E4                LDY   $E4                            
2A0F- 4C F0 00             JMP   $00F0                          
2A12- C8                   INY                                  
2A13- B1 F2                LDA   ($F2),Y                        
2A15- 85 06                STA   $06                            
2A17- C8                   INY                                  
2A18- B1 F2                LDA   ($F2),Y                        
2A1A- 85 07                STA   $07                            
2A1C- 84 E4                STY   $E4                            
2A1E- 8D 02 C0             STA   CLRRAMRD                       
2A21- A0 00                LDY   #$00                           
2A23- B1 06                LDA   ($06),Y                        
2A25- 18                   CLC                                  
2A26- 75 C0                ADC   $C0,X                          
2A28- 95 C0                STA   $C0,X                          
2A2A- C8                   INY                                  
2A2B- B1 06                LDA   ($06),Y                        
2A2D- 75 A0                ADC   $A0,X                          
2A2F- 95 A0                STA   $A0,X                          
2A31- 8D 03 C0             STA   SETRAMRD                       
2A34- A4 E4                LDY   $E4                            
2A36- 4C F0 00             JMP   $00F0                          
2A39- C8                   INY                                  
2A3A- B1 F2                LDA   ($F2),Y                        
2A3C- 95 9E                STA   $9E,X                          
2A3E- C8                   INY                                  
2A3F- B1 F2                LDA   ($F2),Y                        
2A41- 95 9F                STA   $9F,X                          
2A43- A1 9E                LDA   ($9E,X)                        
2A45- 84 E4                STY   $E4                            
2A47- A0 00                LDY   #$00                           
2A49- 0A                   ASL                                  
2A4A- 90 02                BCC   L2A4E                          
2A4C- C8                   INY                                  
2A4D- 18                   CLC                                  
2A4E- 75 C0     L2A4E      ADC   $C0,X                          
2A50- 95 C0                STA   $C0,X                          
2A52- 98                   TYA                                  
2A53- 75 A0                ADC   $A0,X                          
2A55- 95 A0                STA   $A0,X                          
2A57- A4 E4                LDY   $E4                            
2A59- 4C F0 00             JMP   $00F0                          
2A5C- C8                   INY                                  
2A5D- B1 F2                LDA   ($F2),Y                        
2A5F- 95 9E                STA   $9E,X                          
2A61- C8                   INY                                  
2A62- B1 F2                LDA   ($F2),Y                        
2A64- 95 9F                STA   $9F,X                          
2A66- 8D 02 C0             STA   CLRRAMRD                       
2A69- A1 9E                LDA   ($9E,X)                        
2A6B- 84 E4                STY   $E4                            
2A6D- A0 00                LDY   #$00                           
2A6F- 0A                   ASL                                  
2A70- 90 02                BCC   L2A74                          
2A72- C8                   INY                                  
2A73- 18                   CLC                                  
2A74- 75 C0     L2A74      ADC   $C0,X                          
2A76- 95 C0                STA   $C0,X                          
2A78- 98                   TYA                                  
2A79- 75 A0                ADC   $A0,X                          
2A7B- 95 A0                STA   $A0,X                          
2A7D- A4 E4                LDY   $E4                            
2A7F- 8D 03 C0             STA   SETRAMRD                       
2A82- 4C F0 00             JMP   $00F0                          
2A85- C8                   INY                                  
2A86- B1 F2                LDA   ($F2),Y                        
2A88- 85 06                STA   $06                            
2A8A- C8                   INY                                  
2A8B- B1 F2                LDA   ($F2),Y                        
2A8D- 85 07                STA   $07                            
2A8F- 84 E4                STY   $E4                            
2A91- A0 00                LDY   #$00                           
2A93- B1 06                LDA   ($06),Y                        
2A95- 0A                   ASL                                  
2A96- 85 E7                STA   $E7                            
2A98- C8                   INY                                  
2A99- B1 06                LDA   ($06),Y                        
2A9B- 2A                   ROL                                  
2A9C- 85 E8                STA   $E8                            
2A9E- A5 E7                LDA   $E7                            
2AA0- 18                   CLC                                  
2AA1- 75 C0                ADC   $C0,X                          
2AA3- 95 C0                STA   $C0,X                          
2AA5- A5 E8                LDA   $E8                            
2AA7- 75 A0                ADC   $A0,X                          
2AA9- 95 A0                STA   $A0,X                          
2AAB- A4 E4                LDY   $E4                            
2AAD- 4C F0 00             JMP   $00F0                          
2AB0- C8                   INY                                  
2AB1- B1 F2                LDA   ($F2),Y                        
2AB3- 85 06                STA   $06                            
2AB5- C8                   INY                                  
2AB6- B1 F2                LDA   ($F2),Y                        
2AB8- 85 07                STA   $07                            
2ABA- 84 E4                STY   $E4                            
2ABC- 8D 02 C0             STA   CLRRAMRD                       
2ABF- A0 00                LDY   #$00                           
2AC1- B1 06                LDA   ($06),Y                        
2AC3- 0A                   ASL                                  
2AC4- 85 E7                STA   $E7                            
2AC6- C8                   INY                                  
2AC7- B1 06                LDA   ($06),Y                        
2AC9- 2A                   ROL                                  
2ACA- 85 E8                STA   $E8                            
2ACC- A5 E7                LDA   $E7                            
2ACE- 18                   CLC                                  
2ACF- 75 C0                ADC   $C0,X                          
2AD1- 95 C0                STA   $C0,X                          
2AD3- A5 E8                LDA   $E8                            
2AD5- 75 A0                ADC   $A0,X                          
2AD7- 95 A0                STA   $A0,X                          
2AD9- 8D 03 C0             STA   SETRAMRD                       
2ADC- A4 E4                LDY   $E4                            
2ADE- 4C F0 00             JMP   $00F0                          
2AE1- B5 C0                LDA   $C0,X                          
2AE3- 95 9F                STA   $9F,X                          
2AE5- B5 C1                LDA   $C1,X                          
2AE7- 81 9F                STA   ($9F,X)                        
2AE9- E8                   INX                                  
2AEA- 4C EF 00             JMP   $00EF                          
2AED- B5 C0                LDA   $C0,X                          
2AEF- 95 9F                STA   $9F,X                          
2AF1- B5 C1                LDA   $C1,X                          
2AF3- 81 9F                STA   ($9F,X)                        
2AF5- B5 A1                LDA   $A1,X                          
2AF7- F6 9F                INC   $9F,X                          
2AF9- F0 06                BEQ   L2B01                          
2AFB- 81 9F                STA   ($9F,X)                        
2AFD- E8                   INX                                  
2AFE- 4C EF 00             JMP   $00EF                          
2B01- F6 A0     L2B01      INC   $A0,X                          
2B03- 81 9F                STA   ($9F,X)                        
2B05- E8                   INX                                  
2B06- 4C EF 00             JMP   $00EF                          
2B09- C8                   INY                                  
2B0A- B1 F2                LDA   ($F2),Y                        
2B0C- 84 E4                STY   $E4                            
2B0E- A8                   TAY                                  
2B0F- B5 C0                LDA   $C0,X                          
2B11- 91 E0                STA   (XO),Y                         
2B13- A4 E4                LDY   $E4                            
2B15- 30 19                BMI   L2B30                          
2B17- 4C EF 00             JMP   $00EF                          
2B1A- C8                   INY                                  
2B1B- B1 F2                LDA   ($F2),Y                        
2B1D- 84 E4                STY   $E4                            
2B1F- A8                   TAY                                  
2B20- B5 C0                LDA   $C0,X                          
2B22- 91 E0                STA   (XO),Y                         
2B24- C8                   INY                                  
2B25- B5 A0                LDA   $A0,X                          
2B27- 91 E0                STA   (XO),Y                         
2B29- A4 E4                LDY   $E4                            
2B2B- 30 03                BMI   L2B30                          
2B2D- 4C EF 00             JMP   $00EF                          
2B30- 98        L2B30      TYA                                  
2B31- A0 00                LDY   #$00                           
2B33- 18                   CLC                                  
2B34- 65 F2                ADC   $F2                            
2B36- 85 F2                STA   $F2                            
2B38- 90 02                BCC   L2B3C                          
2B3A- E6 F3                INC   $F3                            
2B3C- 4C EF 00  L2B3C      JMP   $00EF                          
2B3F- C8                   INY                                  
2B40- B1 F2                LDA   ($F2),Y                        
2B42- 84 E4                STY   $E4                            
2B44- A8                   TAY                                  
2B45- B5 C0                LDA   $C0,X                          
2B47- 91 E0                STA   (XO),Y                         
2B49- A9 00                LDA   #$00                           
2B4B- 95 A0                STA   $A0,X                          
2B4D- A4 E4                LDY   $E4                            
2B4F- 4C F0 00             JMP   $00F0                          
2B52- C8                   INY                                  
2B53- B1 F2                LDA   ($F2),Y                        
2B55- 84 E4                STY   $E4                            
2B57- A8                   TAY                                  
2B58- B5 C0                LDA   $C0,X                          
2B5A- 91 E0                STA   (XO),Y                         
2B5C- C8                   INY                                  
2B5D- B5 A0                LDA   $A0,X                          
2B5F- 91 E0                STA   (XO),Y                         
2B61- A4 E4                LDY   $E4                            
2B63- 4C F0 00             JMP   $00F0                          
2B66- 98        L2B66      TYA                                  
2B67- 18                   CLC                                  
2B68- 65 F2                ADC   $F2                            
2B6A- 85 F2                STA   $F2                            
2B6C- 90 02                BCC   L2B70                          
2B6E- E6 F3                INC   $F3                            
2B70- A0 FF     L2B70      LDY   #$FF                           
2B72- C8                   INY                                  
2B73- 30 F1                BMI   L2B66                          
2B75- B1 F2                LDA   ($F2),Y                        
2B77- 95 9E                STA   $9E,X                          
2B79- C8                   INY                                  
2B7A- B1 F2                LDA   ($F2),Y                        
2B7C- 95 9F                STA   $9F,X                          
2B7E- B5 C0                LDA   $C0,X                          
2B80- 81 9E                STA   ($9E,X)                        
2B82- 4C EF 00             JMP   $00EF                          
2B85- C8                   INY                                  
2B86- B1 F2                LDA   ($F2),Y                        
2B88- 85 E7                STA   $E7                            
2B8A- C8                   INY                                  
2B8B- B1 F2                LDA   ($F2),Y                        
2B8D- 85 E8                STA   $E8                            
2B8F- 84 E4                STY   $E4                            
2B91- A0 00                LDY   #$00                           
2B93- B5 C0                LDA   $C0,X                          
2B95- 91 E7                STA   ($E7),Y                        
2B97- C8                   INY                                  
2B98- B5 A0                LDA   $A0,X                          
2B9A- 91 E7                STA   ($E7),Y                        
2B9C- A4 E4                LDY   $E4                            
2B9E- 30 03                BMI   L2BA3                          
2BA0- 4C EF 00             JMP   $00EF                          
2BA3- 4C 13 DA  L2BA3      JMP   $DA13                          
2BA6- C8                   INY                                  
2BA7- B1 F2                LDA   ($F2),Y                        
2BA9- 95 9E                STA   $9E,X                          
2BAB- C8                   INY                                  
2BAC- B1 F2                LDA   ($F2),Y                        
2BAE- 95 9F                STA   $9F,X                          
2BB0- B5 C0                LDA   $C0,X                          
2BB2- 81 9E                STA   ($9E,X)                        
2BB4- A9 00                LDA   #$00                           
2BB6- 95 A0                STA   $A0,X                          
2BB8- 4C F0 00             JMP   $00F0                          
2BBB- C8                   INY                                  
2BBC- B1 F2                LDA   ($F2),Y                        
2BBE- 85 E7                STA   $E7                            
2BC0- C8                   INY                                  
2BC1- B1 F2                LDA   ($F2),Y                        
2BC3- 85 E8                STA   $E8                            
2BC5- 84 E4                STY   $E4                            
2BC7- A0 00                LDY   #$00                           
2BC9- B5 C0                LDA   $C0,X                          
2BCB- 91 E7                STA   ($E7),Y                        
2BCD- C8                   INY                                  
2BCE- B5 A0                LDA   $A0,X                          
2BD0- 91 E7                STA   ($E7),Y                        
2BD2- A4 E4                LDY   $E4                            
2BD4- 4C F0 00             JMP   $00F0                          
2BD7- B5 C0                LDA   $C0,X                          
2BD9- D5 C1                CMP   $C1,X                          
2BDB- D0 1B                BNE   L2BF8                          
2BDD- B5 A0                LDA   $A0,X                          
2BDF- D5 A1                CMP   $A1,X                          
2BE1- D0 15                BNE   L2BF8                          
2BE3- A9 FF     L2BE3      LDA   #$FF                           
2BE5- 95 C1                STA   $C1,X                          
2BE7- 95 A1                STA   $A1,X                          
2BE9- 4C EF 00             JMP   $00EF                          
2BEC- B5 C0                LDA   $C0,X                          
2BEE- D5 C1                CMP   $C1,X                          
2BF0- D0 F1                BNE   L2BE3                          
2BF2- B5 A0                LDA   $A0,X                          
2BF4- D5 A1                CMP   $A1,X                          
2BF6- D0 EB                BNE   L2BE3                          
2BF8- A9 00     L2BF8      LDA   #$00                           
2BFA- 95 C1                STA   $C1,X                          
2BFC- 95 A1                STA   $A1,X                          
2BFE- 4C EF 00             JMP   $00EF                          
2C01- B5 C1                LDA   $C1,X                          
2C03- D5 C0                CMP   $C0,X                          
2C05- B5 A1                LDA   $A1,X                          
2C07- F5 A0                SBC   $A0,X                          
2C09- 70 04                BVS   L2C0F                          
2C0B- 10 D6                BPL   L2BE3                          
2C0D- 30 E9                BMI   L2BF8                          
2C0F- 10 E7     L2C0F      BPL   L2BF8                          
2C11- 30 D0                BMI   L2BE3                          
2C13- B5 C0                LDA   $C0,X                          
2C15- D5 C1                CMP   $C1,X                          
2C17- B5 A0                LDA   $A0,X                          
2C19- F5 A1                SBC   $A1,X                          
2C1B- 70 F2                BVS   L2C0F                          
2C1D- 10 C4                BPL   L2BE3                          
2C1F- 30 D7                BMI   L2BF8                          
2C21- B5 C0                LDA   $C0,X                          
2C23- D5 C1                CMP   $C1,X                          
2C25- B5 A0                LDA   $A0,X                          
2C27- F5 A1                SBC   $A1,X                          
2C29- 70 04                BVS   L2C2F                          
2C2B- 30 B6                BMI   L2BE3                          
2C2D- 10 C9                BPL   L2BF8                          
2C2F- 30 C7     L2C2F      BMI   L2BF8                          
2C31- 10 B0                BPL   L2BE3                          
2C33- B5 C1                LDA   $C1,X                          
2C35- D5 C0                CMP   $C0,X                          
2C37- B5 A1                LDA   $A1,X                          
2C39- F5 A0                SBC   $A0,X                          
2C3B- 70 F2                BVS   L2C2F                          
2C3D- 30 A4                BMI   L2BE3                          
2C3F- 10 B7                BPL   L2BF8                          
2C41- E8                   INX                                  
2C42- 98                   TYA                                  
2C43- 38                   SEC                                  
2C44- 65 F2                ADC   $F2                            
2C46- 85 E7                STA   $E7                            
2C48- A9 00                LDA   #$00                           
2C4A- A8                   TAY                                  
2C4B- 65 F3                ADC   $F3                            
2C4D- 85 E8                STA   $E8                            
2C4F- B1 E7                LDA   ($E7),Y                        
2C51- 65 E7                ADC   $E7                            
2C53- 85 F2                STA   $F2                            
2C55- C8                   INY                                  
2C56- B1 E7                LDA   ($E7),Y                        
2C58- 65 E8                ADC   $E8                            
2C5A- 85 F3                STA   $F3                            
2C5C- 88                   DEY                                  
2C5D- B1 F2                LDA   ($F2),Y                        
2C5F- 85 E7                STA   $E7                            
2C61- E6 F2                INC   $F2                            
2C63- D0 02                BNE   L2C67                          
2C65- E6 F3                INC   $F3                            
2C67- B5 BF     L2C67      LDA   $BF,X                          
2C69- D1 F2                CMP   ($F2),Y                        
2C6B- F0 14                BEQ   L2C81                          
2C6D- B5 9F                LDA   $9F,X                          
2C6F- C8                   INY                                  
2C70- F1 F2                SBC   ($F2),Y                        
2C72- 30 16                BMI   L2C8A                          
2C74- C8        L2C74      INY                                  
2C75- C8                   INY                                  
2C76- C6 E7                DEC   $E7                            
2C78- F0 2A                BEQ   L2CA4                          
2C7A- C8                   INY                                  
2C7B- D0 EA                BNE   L2C67                          
2C7D- E6 F3                INC   $F3                            
2C7F- D0 E6                BNE   L2C67                          
2C81- B5 9F     L2C81      LDA   $9F,X                          
2C83- C8                   INY                                  
2C84- F1 F2                SBC   ($F2),Y                        
2C86- F0 72                BEQ   L2CFA                          
2C88- 10 EA                BPL   L2C74                          
2C8A- A9 00     L2C8A      LDA   #$00                           
2C8C- 85 E8                STA   $E8                            
2C8E- C6 E7                DEC   $E7                            
2C90- A5 E7                LDA   $E7                            
2C92- 0A                   ASL                                  
2C93- 26 E8                ROL   $E8                            
2C95- 0A                   ASL                                  
2C96- 26 E8                ROL   $E8                            
2C98- 65 F2                ADC   $F2                            
2C9A- 85 F2                STA   $F2                            
2C9C- A5 E8                LDA   $E8                            
2C9E- 65 F3                ADC   $F3                            
2CA0- 85 F3                STA   $F3                            
2CA2- C8                   INY                                  
2CA3- C8                   INY                                  
2CA4- 98        L2CA4      TYA                                  
2CA5- A0 00                LDY   #$00                           
2CA7- 38                   SEC                                  
2CA8- 65 F2                ADC   $F2                            
2CAA- 85 F2                STA   $F2                            
2CAC- 90 02                BCC   L2CB0                          
2CAE- E6 F3                INC   $F3                            
2CB0- 4C F1 00  L2CB0      JMP   $00F1                          
2CB3- B5 C0                LDA   $C0,X                          
2CB5- 15 A0                ORA   $A0,X                          
2CB7- F0 41                BEQ   L2CFA                          
2CB9- E8                   INX                                  
2CBA- D0 30                BNE   L2CEC                          
2CBC- B5 C0                LDA   $C0,X                          
2CBE- 15 A0                ORA   $A0,X                          
2CC0- D0 38                BNE   L2CFA                          
2CC2- E8                   INX                                  
2CC3- D0 27                BNE   L2CEC                          
2CC5- E8                   INX                                  
2CC6- E8                   INX                                  
2CC7- B5 BE                LDA   $BE,X                          
2CC9- D5 BF                CMP   $BF,X                          
2CCB- D0 1F                BNE   L2CEC                          
2CCD- B5 9E                LDA   $9E,X                          
2CCF- D5 9F                CMP   $9F,X                          
2CD1- F0 27                BEQ   L2CFA                          
2CD3- D0 17                BNE   L2CEC                          
2CD5- E8                   INX                                  
2CD6- E8                   INX                                  
2CD7- B5 BE                LDA   $BE,X                          
2CD9- D5 BF                CMP   $BF,X                          
2CDB- D0 1D                BNE   L2CFA                          
2CDD- B5 9E                LDA   $9E,X                          
2CDF- D5 9F                CMP   $9F,X                          
2CE1- D0 17                BNE   L2CFA                          
2CE3- F0 07                BEQ   L2CEC                          
2CE5- E8                   INX                                  
2CE6- B5 9F                LDA   $9F,X                          
2CE8- 15 BF                ORA   $BF,X                          
2CEA- D0 0E                BNE   L2CFA                          
2CEC- C8        L2CEC      INY                                  
2CED- C8                   INY                                  
2CEE- 30 B4                BMI   L2CA4                          
2CF0- 4C F0 00             JMP   $00F0                          
2CF3- E8                   INX                                  
2CF4- B5 9F                LDA   $9F,X                          
2CF6- 15 BF                ORA   $BF,X                          
2CF8- D0 F2                BNE   L2CEC                          
2CFA- 98        L2CFA      TYA                                  
2CFB- 38                   SEC                                  
2CFC- 65 F2                ADC   $F2                            
2CFE- 85 E7                STA   $E7                            
2D00- A9 00                LDA   #$00                           
2D02- A8                   TAY                                  
2D03- 65 F3                ADC   $F3                            
2D05- 85 E8                STA   $E8                            
2D07- B1 E7                LDA   ($E7),Y                        
2D09- 65 E7                ADC   $E7                            
2D0B- 85 F2                STA   $F2                            
2D0D- C8                   INY                                  
2D0E- B1 E7                LDA   ($E7),Y                        
2D10- 65 E8                ADC   $E8                            
2D12- 85 F3                STA   $F3                            
2D14- 88                   DEY                                  
2D15- 4C F1 00             JMP   $00F1                          
2D18- B5 C1                LDA   $C1,X                          
2D1A- D5 C0                CMP   $C0,X                          
2D1C- B5 A1                LDA   $A1,X                          
2D1E- F5 A0                SBC   $A0,X                          
2D20- 70 12                BVS   L2D34                          
2D22- 10 C8                BPL   L2CEC                          
2D24- 30 D4                BMI   L2CFA                          
2D26- B5 C0                LDA   $C0,X                          
2D28- D5 C1                CMP   $C1,X                          
2D2A- B5 A0                LDA   $A0,X                          
2D2C- F5 A1                SBC   $A1,X                          
2D2E- 70 04                BVS   L2D34                          
2D30- 10 BA                BPL   L2CEC                          
2D32- 30 C6                BMI   L2CFA                          
2D34- 30 B6     L2D34      BMI   L2CEC                          
2D36- 10 C2                BPL   L2CFA                          
2D38- D6 C0                DEC   $C0,X                          
2D3A- B5 C0                LDA   $C0,X                          
2D3C- C9 FF                CMP   #$FF                           
2D3E- D0 04                BNE   L2D44                          
2D40- D6 A0                DEC   $A0,X                          
2D42- B5 C0     L2D42      LDA   $C0,X                          
2D44- D5 C1     L2D44      CMP   $C1,X                          
2D46- B5 A0                LDA   $A0,X                          
2D48- F5 A1                SBC   $A1,X                          
2D4A- 70 18                BVS   L2D64                          
2D4C- 10 AC                BPL   L2CFA                          
2D4E- 30 9C                BMI   L2CEC                          
2D50- F6 C0                INC   $C0,X                          
2D52- D0 02                BNE   L2D56                          
2D54- F6 A0                INC   $A0,X                          
2D56- B5 C1     L2D56      LDA   $C1,X                          
2D58- D5 C0                CMP   $C0,X                          
2D5A- B5 A1                LDA   $A1,X                          
2D5C- F5 A0                SBC   $A0,X                          
2D5E- 70 04                BVS   L2D64                          
2D60- 10 98                BPL   L2CFA                          
2D62- 30 88                BMI   L2CEC                          
2D64- 30 94     L2D64      BMI   L2CFA                          
2D66- 10 84                BPL   L2CEC                          
2D68- B5 C1                LDA   $C1,X                          
2D6A- 38                   SEC                                  
2D6B- F5 C0                SBC   $C0,X                          
2D6D- 95 C1                STA   $C1,X                          
2D6F- B5 A1                LDA   $A1,X                          
2D71- F5 A0                SBC   $A0,X                          
2D73- 95 A1                STA   $A1,X                          
2D75- E8                   INX                                  
2D76- D0 CA                BNE   L2D42                          
2D78- B5 C0                LDA   $C0,X                          
2D7A- 18                   CLC                                  
2D7B- 75 C1                ADC   $C1,X                          
2D7D- 95 C1                STA   $C1,X                          
2D7F- B5 A0                LDA   $A0,X                          
2D81- 75 A1                ADC   $A1,X                          
2D83- 95 A1                STA   $A1,X                          
2D85- E8                   INX                                  
2D86- D0 CE                BNE   L2D56                          
2D88- C8                   INY                                  
2D89- B1 F2                LDA   ($F2),Y                        
2D8B- 85 E7                STA   $E7                            
2D8D- C8                   INY                                  
2D8E- B1 F2                LDA   ($F2),Y                        
2D90- 85 E8                STA   $E8                            
2D92- 98                   TYA                                  
2D93- 38                   SEC                                  
2D94- 65 F2                ADC   $F2                            
2D96- 48                   PHA                                  
2D97- A5 F3                LDA   $F3                            
2D99- 69 00                ADC   #$00                           
2D9B- 48                   PHA                                  
2D9C- 20 E6 00             JSR   HPAG                           
2D9F- 68                   PLA                                  
2DA0- 85 F3                STA   $F3                            
2DA2- 68                   PLA                                  
2DA3- 85 F2                STA   $F2                            
2DA5- A9 D0                LDA   #$D0                           
2DA7- 85 F8                STA   $F8                            
2DA9- A0 00                LDY   #$00                           
2DAB- 4C F1 00             JMP   $00F1                          
2DAE- C8                   INY                                  
2DAF- B1 F2                LDA   ($F2),Y                        
2DB1- 85 E7                STA   $E7                            
2DB3- C8                   INY                                  
2DB4- B1 F2                LDA   ($F2),Y                        
2DB6- 85 E8                STA   $E8                            
2DB8- 8D 02 C0             STA   CLRRAMRD                       
2DBB- 28                   PLP                                  
2DBC- 98                   TYA                                  
2DBD- 38                   SEC                                  
2DBE- 65 F2                ADC   $F2                            
2DC0- 48                   PHA                                  
2DC1- A5 F3                LDA   $F3                            
2DC3- 69 00                ADC   #$00                           
2DC5- 48                   PHA                                  
2DC6- 20 E6 00             JSR   HPAG                           
2DC9- 68                   PLA                                  
2DCA- 85 F3                STA   $F3                            
2DCC- 68                   PLA                                  
2DCD- 85 F2                STA   $F2                            
2DCF- A9 D2                LDA   #$D2                           
2DD1- 85 F8                STA   $F8                            
2DD3- A0 00                LDY   #$00                           
2DD5- 08                   PHP                                  
2DD6- 78                   SEI                                  
2DD7- 8D 03 C0             STA   SETRAMRD                       
2DDA- 4C F1 00             JMP   $00F1                          
2DDD- B5 C0                LDA   $C0,X                          
2DDF- 85 E7                STA   $E7                            
2DE1- B5 A0                LDA   $A0,X                          
2DE3- 85 E8                STA   $E8                            
2DE5- E8                   INX                                  
2DE6- 98                   TYA                                  
2DE7- 38                   SEC                                  
2DE8- 65 F2                ADC   $F2                            
2DEA- 48                   PHA                                  
2DEB- A5 F3                LDA   $F3                            
2DED- 69 00                ADC   #$00                           
2DEF- 48                   PHA                                  
2DF0- 20 E6 00             JSR   HPAG                           
2DF3- 68                   PLA                                  
2DF4- 85 F3                STA   $F3                            
2DF6- 68                   PLA                                  
2DF7- 85 F2                STA   $F2                            
2DF9- A9 D0                LDA   #$D0                           
2DFB- 85 F8                STA   $F8                            
2DFD- A0 00                LDY   #$00                           
2DFF- 4C F1 00             JMP   $00F1                          
2E02- 8D 02 C0             STA   CLRRAMRD                       
2E05- 28                   PLP                                  
2E06- B5 C0                LDA   $C0,X                          
2E08- 85 E7                STA   $E7                            
2E0A- B5 A0                LDA   $A0,X                          
2E0C- 85 E8                STA   $E8                            
2E0E- E8                   INX                                  
2E0F- 98                   TYA                                  
2E10- 38                   SEC                                  
2E11- 65 F2                ADC   $F2                            
2E13- 48                   PHA                                  
2E14- A5 F3                LDA   $F3                            
2E16- 69 00                ADC   #$00                           
2E18- 48                   PHA                                  
2E19- 20 E6 00             JSR   HPAG                           
2E1C- 68                   PLA                                  
2E1D- 85 F3                STA   $F3                            
2E1F- 68                   PLA                                  
2E20- 85 F2                STA   $F2                            
2E22- A9 D2                LDA   #$D2                           
2E24- 85 F8                STA   $F8                            
2E26- A0 00                LDY   #$00                           
2E28- 08                   PHP                                  
2E29- 78                   SEI                                  
2E2A- 8D 03 C0             STA   SETRAMRD                       
2E2D- 4C F1 00             JMP   $00F1                          
2E30- 68                   PLA                                  
2E31- A8                   TAY                                  
2E32- A5 E1                LDA   $E1                            
2E34- 48                   PHA                                  
2E35- A5 E0                LDA   XO                             
2E37- 48                   PHA                                  
2E38- 98                   TYA                                  
2E39- 48                   PHA                                  
2E3A- A5 E2                LDA   YO                             
2E3C- A0 01                LDY   #$01                           
2E3E- 38                   SEC                                  
2E3F- F1 F2                SBC   ($F2),Y                        
2E41- 85 E2                STA   YO                             
2E43- 85 E0                STA   XO                             
2E45- A5 E3                LDA   $E3                            
2E47- E9 00                SBC   #$00                           
2E49- 85 E3                STA   $E3                            
2E4B- 85 E1                STA   $E1                            
2E4D- C8                   INY                                  
2E4E- B1 F2                LDA   ($F2),Y                        
2E50- F0 0F                BEQ   L2E61                          
2E52- 0A                   ASL                                  
2E53- A8                   TAY                                  
2E54- B5 A0     L2E54      LDA   $A0,X                          
2E56- 88                   DEY                                  
2E57- 91 E0                STA   (XO),Y                         
2E59- B5 C0                LDA   $C0,X                          
2E5B- E8                   INX                                  
2E5C- 88                   DEY                                  
2E5D- 91 E0                STA   (XO),Y                         
2E5F- D0 F3                BNE   L2E54                          
2E61- A0 03     L2E61      LDY   #$03                           
2E63- 4C F1 00             JMP   $00F1                          
2E66- A5 E1                LDA   $E1                            
2E68- 48                   PHA                                  
2E69- A5 E0                LDA   XO                             
2E6B- 48                   PHA                                  
2E6C- A5 E2                LDA   YO                             
2E6E- C8                   INY                                  
2E6F- 38                   SEC                                  
2E70- F1 F2                SBC   ($F2),Y                        
2E72- 85 E2                STA   YO                             
2E74- 85 E0                STA   XO                             
2E76- A5 E3                LDA   $E3                            
2E78- E9 00                SBC   #$00                           
2E7A- 85 E3                STA   $E3                            
2E7C- 85 E1                STA   $E1                            
2E7E- C8                   INY                                  
2E7F- B1 F2                LDA   ($F2),Y                        
2E81- F0 0F                BEQ   L2E92                          
2E83- 0A                   ASL                                  
2E84- A8                   TAY                                  
2E85- B5 A0     L2E85      LDA   $A0,X                          
2E87- 88                   DEY                                  
2E88- 91 E0                STA   (XO),Y                         
2E8A- B5 C0                LDA   $C0,X                          
2E8C- E8                   INX                                  
2E8D- 88                   DEY                                  
2E8E- 91 E0                STA   (XO),Y                         
2E90- D0 F3                BNE   L2E85                          
2E92- A0 03     L2E92      LDY   #$03                           
2E94- 4C F1 00             JMP   $00F1                          
2E97- A5 E0                LDA   XO                             
2E99- C8                   INY                                  
2E9A- 18                   CLC                                  
2E9B- 71 F2                ADC   ($F2),Y                        
2E9D- 85 E2                STA   YO                             
2E9F- A5 E1                LDA   $E1                            
2EA1- 69 00                ADC   #$00                           
2EA3- 85 E3                STA   $E3                            
2EA5- 8D 02 C0             STA   CLRRAMRD                       
2EA8- 28                   PLP                                  
2EA9- 68                   PLA                                  
2EAA- 85 E0                STA   XO                             
2EAC- 68                   PLA                                  
2EAD- 85 E1                STA   $E1                            
2EAF- 60                   RTS                                  
2EB0- 8D 02 C0             STA   CLRRAMRD                       
2EB3- 28                   PLP                                  
2EB4- 60                   RTS                                  
2EB5- A5 E0                LDA   XO                             
2EB7- C8                   INY                                  
2EB8- 18                   CLC                                  
2EB9- 71 F2                ADC   ($F2),Y                        
2EBB- 85 E2                STA   YO                             
2EBD- A5 E1                LDA   $E1                            
2EBF- 69 00                ADC   #$00                           
2EC1- 85 E3                STA   $E3                            
2EC3- 68                   PLA                                  
2EC4- 85 E0                STA   XO                             
2EC6- 68                   PLA                                  
2EC7- 85 E1                STA   $E1                            
2EC9- 60                   RTS                                  
2ECA- 98                   TYA                                  
2ECB- 38                   SEC                                  
2ECC- 65 F2                ADC   $F2                            
2ECE- 85 F2                STA   $F2                            
2ED0- B0 03                BCS   L2ED5                          
2ED2- 6C F2 00             JMP   ($00F2)                        
2ED5- E6 F3     L2ED5      INC   $F3                            
2ED7- 6C F2 00             JMP   ($00F2)                        
2EDA- E8                   INX                                  
2EDB- B5 9F                LDA   $9F,X                          
2EDD- 15 BF                ORA   $BF,X                          
2EDF- F0 0A                BEQ   L2EEB                          
2EE1- C8                   INY                                  
2EE2- C8                   INY                                  
2EE3- 30 03                BMI   L2EE8                          
2EE5- 4C F0 00             JMP   $00F0                          
2EE8- 4C 87 DB  L2EE8      JMP   $DB87                          
2EEB- C8        L2EEB      INY                                  
2EEC- B1 F2                LDA   ($F2),Y                        
2EEE- 48                   PHA                                  
2EEF- C8                   INY                                  
2EF0- B1 F2                LDA   ($F2),Y                        
2EF2- 85 F3                STA   $F3                            
2EF4- 68                   PLA                                  
2EF5- 85 F2                STA   $F2                            
2EF7- A0 00                LDY   #$00                           
2EF9- 4C F1 00             JMP   $00F1                          
2EFC- A9 C6     L2EFC      LDA   #$C6                           
2EFE- A2 D0                LDX   #$D0                           
2F00- A0 13                LDY   #$13                           
2F02- 20 7F 31             JSR   L317F                          
2F05- 7A                   PLY                                  
2F06- 68                   PLA                                  
2F07- C8                   INY                                  
2F08- D0 01                BNE   L2F0B                          
2F0A- 1A                   INC                                  
2F0B- 84 F2     L2F0B      STY   $F2                            
2F0D- 85 F3                STA   $F3                            
2F0F- A0 00                LDY   #$00                           
2F11- A9 D0                LDA   #$D0                           
2F13- 85 F8                STA   $F8                            
2F15- 4C F1 00             JMP   $00F1                          
2F18- A9 69                LDA   #$69                           
2F1A- A2 D5                LDX   #$D5                           
2F1C- A0 09                LDY   #$09                           
2F1E- 20 7F 31             JSR   L317F                          
2F21- CA                   DEX                                  
2F22- 4A                   LSR                                  
2F23- 95 C0                STA   $C0,X                          
2F25- 74 A0                STZ   $A0,X                          
2F27- 4C F0 00             JMP   $00F0                          
2F2A- A9 74                LDA   #$74                           
2F2C- A2 D5                LDX   #$D5                           
2F2E- A0 0B                LDY   #$0B                           
2F30- 20 7F 31             JSR   L317F                          
2F33- CA                   DEX                                  
2F34- 74 A0                STZ   $A0,X                          
2F36- C8                   INY                                  
2F37- B1 F2                LDA   ($F2),Y                        
2F39- 95 C0                STA   $C0,X                          
2F3B- 4C F0 00             JMP   $00F0                          
2F3E- A9 B8                LDA   #$B8                           
2F40- A2 D5                LDX   #$D5                           
2F42- A0 17                LDY   #$17                           
2F44- 20 7F 31             JSR   L317F                          
2F47- CA                   DEX                                  
2F48- 98                   TYA                                  
2F49- 38                   SEC                                  
2F4A- 65 F2                ADC   $F2                            
2F4C- 85 F2                STA   $F2                            
2F4E- 95 C0                STA   $C0,X                          
2F50- A9 00                LDA   #$00                           
2F52- 65 F3                ADC   $F3                            
2F54- 85 F3                STA   $F3                            
2F56- 95 A0                STA   $A0,X                          
2F58- B2 F2                LDA   ($F2)                          
2F5A- A8                   TAY                                  
2F5B- 4C F0 00             JMP   $00F0                          
2F5E- A9 B6                LDA   #$B6                           
2F60- A2 D4                LDX   #$D4                           
2F62- A0 22                LDY   #$22                           
2F64- 20 7F 31             JSR   L317F                          
2F67- 84 E4                STY   $E4                            
2F69- B5 C0                LDA   $C0,X                          
2F6B- C9 08                CMP   #$08                           
2F6D- 90 08                BCC   L2F77                          
2F6F- B4 C1                LDY   $C1,X                          
2F71- 94 A1                STY   $A1,X                          
2F73- 74 C1                STZ   $C1,X                          
2F75- E9 08                SBC   #$08                           
2F77- A8        L2F77      TAY                                  
2F78- F0 0A                BEQ   L2F84                          
2F7A- B5 C1                LDA   $C1,X                          
2F7C- 0A        L2F7C      ASL                                  
2F7D- 36 A1                ROL   $A1,X                          
2F7F- 88                   DEY                                  
2F80- D0 FA                BNE   L2F7C                          
2F82- 95 C1                STA   $C1,X                          
2F84- A4 E4     L2F84      LDY   $E4                            
2F86- 4C EF 00             JMP   $00EF                          
2F89- A9 53                LDA   #$53                           
2F8B- A2 D6                LDX   #$D6                           
2F8D- A0 0D                LDY   #$0D                           
2F8F- 20 7F 31             JSR   L317F                          
2F92- B5 C0                LDA   $C0,X                          
2F94- 95 9F                STA   $9F,X                          
2F96- A1 9F                LDA   ($9F,X)                        
2F98- 95 C0                STA   $C0,X                          
2F9A- 74 A0                STZ   $A0,X                          
2F9C- 4C F0 00             JMP   $00F0                          
2F9F- A9 7E                LDA   #$7E                           
2FA1- A2 D6                LDX   #$D6                           
2FA3- A0 13                LDY   #$13                           
2FA5- 20 7F 31             JSR   L317F                          
2FA8- B5 C0                LDA   $C0,X                          
2FAA- 95 9F                STA   $9F,X                          
2FAC- 8D 02 C0             STA   CLRRAMRD                       
2FAF- A1 9F                LDA   ($9F,X)                        
2FB1- 95 C0                STA   $C0,X                          
2FB3- 74 A0                STZ   $A0,X                          
2FB5- 8D 03 C0             STA   SETRAMRD                       
2FB8- 4C F0 00             JMP   $00F0                          
2FBB- A9 D8                LDA   #$D8                           
2FBD- A2 D6                LDX   #$D6                           
2FBF- A0 12                LDY   #$12                           
2FC1- 20 7F 31             JSR   L317F                          
2FC4- C8                   INY                                  
2FC5- B1 F2                LDA   ($F2),Y                        
2FC7- 84 E4                STY   $E4                            
2FC9- A8                   TAY                                  
2FCA- CA                   DEX                                  
2FCB- B1 E0                LDA   (XO),Y                         
2FCD- 95 C0                STA   $C0,X                          
2FCF- 74 A0                STZ   $A0,X                          
2FD1- A4 E4                LDY   $E4                            
2FD3- 4C F0 00             JMP   $00F0                          
2FD6- A9 01                LDA   #$01                           
2FD8- A2 D7                LDX   #$D7                           
2FDA- A0 18                LDY   #$18                           
2FDC- 20 7F 31             JSR   L317F                          
2FDF- C8                   INY                                  
2FE0- B1 F2                LDA   ($F2),Y                        
2FE2- 84 E4                STY   $E4                            
2FE4- A8                   TAY                                  
2FE5- CA                   DEX                                  
2FE6- 8D 02 C0             STA   CLRRAMRD                       
2FE9- B1 E0                LDA   (XO),Y                         
2FEB- 95 C0                STA   $C0,X                          
2FED- 74 A0                STZ   $A0,X                          
2FEF- 8D 03 C0             STA   SETRAMRD                       
2FF2- A4 E4                LDY   $E4                            
2FF4- 4C F0 00             JMP   $00F0                          
2FF7- A9 2C                LDA   #$2C                           
2FF9- A2 D8                LDX   #$D8                           
2FFB- A0 14                LDY   #$14                           
2FFD- 20 7F 31             JSR   L317F                          
3000- C8                   INY                                  
3001- B1 F2                LDA   ($F2),Y                        
3003- 85 E7                STA   $E7                            
3005- C8                   INY                                  
3006- B1 F2                LDA   ($F2),Y                        
3008- 85 E8                STA   $E8                            
300A- B2 E7                LDA   ($E7)                          
300C- CA                   DEX                                  
300D- 95 C0                STA   $C0,X                          
300F- 74 A0                STZ   $A0,X                          
3011- 4C F0 00             JMP   $00F0                          
3014- A9 42                LDA   #$42                           
3016- A2 D8                LDX   #$D8                           
3018- A0 1C                LDY   #$1C                           
301A- 20 7F 31             JSR   L317F                          
301D- C8                   INY                                  
301E- B1 F2                LDA   ($F2),Y                        
3020- 85 E7                STA   $E7                            
3022- C8                   INY                                  
3023- B1 F2                LDA   ($F2),Y                        
3025- 85 E8                STA   $E8                            
3027- 84 E4                STY   $E4                            
3029- B2 E7                LDA   ($E7)                          
302B- CA                   DEX                                  
302C- 95 C0                STA   $C0,X                          
302E- A0 01                LDY   #$01                           
3030- B1 E7                LDA   ($E7),Y                        
3032- 95 A0                STA   $A0,X                          
3034- A4 E4                LDY   $E4                            
3036- 4C F0 00             JMP   $00F0                          
3039- A9 5F                LDA   #$5F                           
303B- A2 D8                LDX   #$D8                           
303D- A0 1A                LDY   #$1A                           
303F- 20 7F 31             JSR   L317F                          
3042- C8                   INY                                  
3043- B1 F2                LDA   ($F2),Y                        
3045- 85 E7                STA   $E7                            
3047- C8                   INY                                  
3048- B1 F2                LDA   ($F2),Y                        
304A- 85 E8                STA   $E8                            
304C- 8D 02 C0             STA   CLRRAMRD                       
304F- B2 E7                LDA   ($E7)                          
3051- CA                   DEX                                  
3052- 95 C0                STA   $C0,X                          
3054- 74 A0                STZ   $A0,X                          
3056- 8D 03 C0             STA   SETRAMRD                       
3059- 4C F0 00             JMP   $00F0                          
305C- A9 7B                LDA   #$7B                           
305E- A2 D8                LDX   #$D8                           
3060- A0 22                LDY   #$22                           
3062- 20 7F 31             JSR   L317F                          
3065- C8                   INY                                  
3066- B1 F2                LDA   ($F2),Y                        
3068- 85 E7                STA   $E7                            
306A- C8                   INY                                  
306B- B1 F2                LDA   ($F2),Y                        
306D- 85 E8                STA   $E8                            
306F- 84 E4                STY   $E4                            
3071- 8D 02 C0             STA   CLRRAMRD                       
3074- B2 E7                LDA   ($E7)                          
3076- CA                   DEX                                  
3077- 95 C0                STA   $C0,X                          
3079- A0 01                LDY   #$01                           
307B- B1 E7                LDA   ($E7),Y                        
307D- 95 A0                STA   $A0,X                          
307F- 8D 03 C0             STA   SETRAMRD                       
3082- A4 E4                LDY   $E4                            
3084- 4C F0 00             JMP   $00F0                          
3087- A9 68                LDA   #$68                           
3089- A2 DA                LDX   #$DA                           
308B- A0 20                LDY   #$20                           
308D- 20 7F 31             JSR   L317F                          
3090- C8                   INY                                  
3091- B1 F2                LDA   ($F2),Y                        
3093- 85 E7                STA   $E7                            
3095- C8                   INY                                  
3096- B1 F2                LDA   ($F2),Y                        
3098- 85 E8                STA   $E8                            
309A- 84 E4                STY   $E4                            
309C- B5 C0                LDA   $C0,X                          
309E- 92 E7                STA   ($E7)                          
30A0- A0 01                LDY   #$01                           
30A2- B5 A0                LDA   $A0,X                          
30A4- 91 E7                STA   ($E7),Y                        
30A6- A4 E4                LDY   $E4                            
30A8- 30 03                BMI   L30AD                          
30AA- 4C EF 00             JMP   $00EF                          
30AD- 4C 13 DA  L30AD      JMP   $DA13                          
30B0- A9 9E                LDA   #$9E                           
30B2- A2 DA                LDX   #$DA                           
30B4- A0 1B                LDY   #$1B                           
30B6- 20 7F 31             JSR   L317F                          
30B9- C8                   INY                                  
30BA- B1 F2                LDA   ($F2),Y                        
30BC- 85 E7                STA   $E7                            
30BE- C8                   INY                                  
30BF- B1 F2                LDA   ($F2),Y                        
30C1- 85 E8                STA   $E8                            
30C3- 84 E4                STY   $E4                            
30C5- B5 C0                LDA   $C0,X                          
30C7- 92 E7                STA   ($E7)                          
30C9- A0 01                LDY   #$01                           
30CB- B5 A0                LDA   $A0,X                          
30CD- 91 E7                STA   ($E7),Y                        
30CF- A4 E4                LDY   $E4                            
30D1- 4C F0 00             JMP   $00F0                          
30D4- A9 89                LDA   #$89                           
30D6- A2 DA                LDX   #$DA                           
30D8- A0 13                LDY   #$13                           
30DA- 20 7F 31             JSR   L317F                          
30DD- C8                   INY                                  
30DE- B1 F2                LDA   ($F2),Y                        
30E0- 95 9E                STA   $9E,X                          
30E2- C8                   INY                                  
30E3- B1 F2                LDA   ($F2),Y                        
30E5- 95 9F                STA   $9F,X                          
30E7- B5 C0                LDA   $C0,X                          
30E9- 81 9E                STA   ($9E,X)                        
30EB- 74 A0                STZ   $A0,X                          
30ED- 4C F0 00             JMP   $00F0                          
30F0- A9 22                LDA   #$22                           
30F2- A2 DA                LDX   #$DA                           
30F4- A0 11                LDY   #$11                           
30F6- 20 7F 31             JSR   L317F                          
30F9- C8                   INY                                  
30FA- B1 F2                LDA   ($F2),Y                        
30FC- 84 E4                STY   $E4                            
30FE- A8                   TAY                                  
30FF- B5 C0                LDA   $C0,X                          
3101- 91 E0                STA   (XO),Y                         
3103- 74 A0                STZ   $A0,X                          
3105- A4 E4                LDY   $E4                            
3107- 4C F0 00             JMP   $00F0                          
310A- A9 DB                LDA   #$DB                           
310C- A2 DA                LDX   #$DA                           
310E- A0 07                LDY   #$07                           
3110- 20 7F 31             JSR   L317F                          
3113- 74 C1                STZ   $C1,X                          
3115- 74 A1                STZ   $A1,X                          
3117- 4C EF 00             JMP   $00EF                          
311A- A9 DD                LDA   #$DD                           
311C- A2 DB                LDX   #$DB                           
311E- A0 1E                LDY   #$1E                           
3120- 20 7F 31             JSR   L317F                          
3123- 98                   TYA                                  
3124- 38                   SEC                                  
3125- 65 F2                ADC   $F2                            
3127- 85 E7                STA   $E7                            
3129- A9 00                LDA   #$00                           
312B- 65 F3                ADC   $F3                            
312D- 85 E8                STA   $E8                            
312F- B2 E7                LDA   ($E7)                          
3131- 65 E7                ADC   $E7                            
3133- 85 F2                STA   $F2                            
3135- A0 01                LDY   #$01                           
3137- B1 E7                LDA   ($E7),Y                        
3139- 65 E8                ADC   $E8                            
313B- 85 F3                STA   $F3                            
313D- 88                   DEY                                  
313E- 4C F1 00             JMP   $00F1                          
3141- A9 13                LDA   #$13                           
3143- A2 DD                LDX   #$DD                           
3145- A0 34                LDY   #$34                           
3147- 20 7F 31             JSR   L317F                          
314A- 7A                   PLY                                  
314B- A5 E1                LDA   $E1                            
314D- 48                   PHA                                  
314E- A5 E0                LDA   XO                             
3150- 48                   PHA                                  
3151- 5A                   PHY                                  
3152- A5 E2                LDA   YO                             
3154- A0 01                LDY   #$01                           
3156- 38                   SEC                                  
3157- F1 F2                SBC   ($F2),Y                        
3159- 85 E2                STA   YO                             
315B- 85 E0                STA   XO                             
315D- A5 E3                LDA   $E3                            
315F- E9 00                SBC   #$00                           
3161- 85 E3                STA   $E3                            
3163- 85 E1                STA   $E1                            
3165- C8                   INY                                  
3166- B1 F2                LDA   ($F2),Y                        
3168- F0 0F                BEQ   L3179                          
316A- 0A                   ASL                                  
316B- A8                   TAY                                  
316C- B5 A0     L316C      LDA   $A0,X                          
316E- 88                   DEY                                  
316F- 91 E0                STA   (XO),Y                         
3171- B5 C0                LDA   $C0,X                          
3173- E8                   INX                                  
3174- 88                   DEY                                  
3175- 91 E0                STA   (XO),Y                         
3177- D0 F3                BNE   L316C                          
3179- A0 03     L3179      LDY   #$03                           
317B- 4C F1 00             JMP   $00F1                          
317E- 60                   RTS                                  
317F- 85 08     L317F      STA   $08                            
3181- 86 09                STX   $09                            
3183- 68                   PLA                                  
3184- 85 06                STA   $06                            
3186- 68                   PLA                                  
3187- 85 07                STA   $07                            
3189- 98                   TYA                                  
318A- 18                   CLC                                  
318B- 65 06                ADC   $06                            
318D- AA                   TAX                                  
318E- A9 00                LDA   #$00                           
3190- 65 07                ADC   $07                            
3192- 48                   PHA                                  
3193- DA                   PHX                                  
3194- E6 06                INC   $06                            
3196- D0 02                BNE   L319A                          
3198- E6 07                INC   $07                            
319A- 88        L319A      DEY                                  
319B- B1 06     L319B      LDA   ($06),Y                        
319D- 91 08                STA   ($08),Y                        
319F- 88                   DEY                                  
31A0- 10 F9                BPL   L319B                          
31A2- 60                   RTS                                  
