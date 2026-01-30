2000- AD 98 BF  L2000      LDA   $BF98                          
2003- 29 30                AND   #$30                           
2005- C9 30                CMP   #$30                           
2007- D0 0E                BNE   L2017                          
2009- A0 00                LDY   #$00                           
200B- B9 11 2A  L200B      LDA   L2A11,Y                        
200E- 99 00 10             STA   $1000,Y                        
2011- C8                   INY                                  
2012- D0 F7                BNE   L200B                          
2014- 20 00 10             JSR   $1000                          
2017- 2C 83 C0  L2017      BIT   PHASE1ON                       
201A- 2C 83 C0             BIT   PHASE1ON                       
201D- A9 85                LDA   #$85                           
201F- 85 06                STA   $06                            
2021- A9 20                LDA   #$20                           
2023- 85 07                STA   $07                            
2025- A0 00                LDY   #$00                           
2027- 84 08                STY   $08                            
2029- A9 D0                LDA   #$D0                           
202B- 85 09                STA   $09                            
202D- B1 06     L202D      LDA   ($06),Y                        
202F- 91 08                STA   ($08),Y                        
2031- C8                   INY                                  
2032- D0 F9                BNE   L202D                          
2034- E6 07                INC   $07                            
2036- E6 09                INC   $09                            
2038- A5 09                LDA   $09                            
203A- C9 E0                CMP   #$E0                           
203C- D0 EF                BNE   L202D                          
203E- B9 00 D1  L203E      LDA   $D100,Y                        
2041- 99 00 10             STA   $1000,Y                        
2044- C8                   INY                                  
2045- D0 F7                BNE   L203E                          
2047- 20 00 BF             JSR   MLI                            
204A- C7 82                ???   $82                            
204C- 20 AC 00             JSR   $00AC                          
204F- 03                   ???                                  
2050- A9 2F                LDA   #$2F                           
2052- D9 00 03             CMP   $0300,Y                        
2055- F0 04                BEQ   L205B                          
2057- C8                   INY                                  
2058- 99 00 03             STA   $0300,Y                        
205B- A9 43     L205B      LDA   #$43                           
205D- C8                   INY                                  
205E- 99 00 03             STA   $0300,Y                        
2061- A9 4D                LDA   #$4D                           
2063- C8                   INY                                  
2064- 99 00 03             STA   $0300,Y                        
2067- A9 44                LDA   #$44                           
2069- C8                   INY                                  
206A- 99 00 03             STA   $0300,Y                        
206D- 8C 00 03             STY   $0300                          
2070- 2C 83 C0             BIT   PHASE1ON                       
2073- 2C 83 C0             BIT   PHASE1ON                       
2076- B9 00 03  L2076      LDA   $0300,Y                        
2079- 99 C1 D1             STA   $D1C1,Y                        
207C- 88                   DEY                                  
207D- 10 F7                BPL   L2076                          
207F- 4C 0C 10             JMP   $100C                          
2082- 01 00                ORA   ($00,X)                        
2084- 03                   ???                                  
2085- 31 D4                AND   ($D4),Y                        
2087- 39 D4 39             AND   $39D4,Y                        
208A- D4 39                ???   KSWH                           
208C- D4 39                ???   KSWH                           
208E- D4 39                ???   KSWH                           
2090- D4 39                ???   KSWH                           
2092- D4 39                ???   KSWH                           
2094- D4 39                ???   KSWH                           
2096- D4 39                ???   KSWH                           
2098- D4 39                ???   KSWH                           
209A- D4 39                ???   KSWH                           
209C- D4 39                ???   KSWH                           
209E- D4 39                ???   KSWH                           
20A0- D4 39                ???   KSWH                           
20A2- D4 39                ???   KSWH                           
20A4- D4 27                ???   GBASH                          
20A6- D4 21                ???   WNDWDTH                        
20A8- D8                   CLD                                  
20A9- 31 D8                AND   ($D8),Y                        
20AB- 6A                   ROR                                  
20AC- D4 D7                ???   $D7                            
20AE- D4 44                ???   A5L                            
20B0- D4 7A                ???   $7A                            
20B2- D4 88                ???   $88                            
20B4- D4 EF                ???   $EF                            
20B6- 00                   BRK                                  
20B7- 61 D6                ADC   ($D6,X)                        
20B9- D6 D3                DEC   $D3,X                          
20BB- 14 D3                TRB   $D3                            
20BD- E2 D3     L20BD      ???   $D3                            
20BF- F1 D3                SBC   ($D3),Y                        
20C1- 00                   BRK                                  
20C2- D4 0E                ???   $0E                            
20C4- D4 33                ???   $33                            
20C6- D7 48                ???   $48                            
20C8- D7 7D                ???   $7D                            
20CA- D7 8F                ???   $8F                            
20CC- D7 5D                ???   $5D                            
20CE- D7 6F                ???   $6F                            
20D0- D7 4F                ???   RNDH                           
20D2- D8                   CLD                                  
20D3- 41 D8                EOR   ($D8,X)                        
20D5- 56 D8                LSR   $D8,X                          
20D7- 9D D7 E4             STA   $E4D7,X                        
20DA- D8                   CLD                                  
20DB- 06 D9                ASL   $D9                            
20DD- 27 D9                ???   $D9                            
20DF- 4C D9 59             JMP   $59D9                          
20E2- D9 51 D4             CMP   $D451,Y                        
20E5- A0 D4                LDY   #$D4                           
20E7- AF D4                ???   L20BD                          
20E9- EB                   ???                                  
20EA- D4 FF                ???   $FF                            
20EC- D4 83                ???   $83                            
20EE- D5 99                CMP   $99,X                          
20F0- D5 9B                CMP   $9B,X                          
20F2- D6 AE                DEC   $AE,X                          
20F4- D6 3D                DEC   A1H,X                          
20F6- D6 49                DEC   $49,X                          
20F8- D6 65                DEC   $65,X                          
20FA- D6 76                DEC   $76,X                          
20FC- D6 CE                DEC   $CE,X                          
20FE- D6 E1                DEC   $E1,X                          
2100- D6 02                DEC   $02,X                          
2102- D7 17                ???   $17                            
2104- D7 18                ???   $18                            
2106- D4 00                ???   $00                            
2108- D2 10                CMP   ($10)                          
210A- D2 33                CMP   ($33)                          
210C- D2 F8                CMP   ($F8)                          
210E- D2 02                CMP   ($02)                          
2110- D3                   ???                                  
2111- 2E D3 3A             ROL   $3AD3                          
2114- D3                   ???                                  
2115- E8                   INX                                  
2116- D2 4A                CMP   ($4A)                          
2118- D3                   ???                                  
2119- 59 D3 68             EOR   $68D3,Y                        
211C- D3                   ???                                  
211D- 77 D3                ???   $D3                            
211F- 86 D3                STX   $D3                            
2121- AA                   TAX                                  
2122- D3                   ???                                  
2123- 20 D2 74             JSR   $74D2                          
2126- D8                   CLD                                  
2127- 82 D8                ???   $D8                            
2129- AC D8 D4             LDY   $D4D8                          
212C- D8                   CLD                                  
212D- 94 D8                STY   $D8,X                          
212F- C4 D8                CPY   $D8                            
2131- 0F D8                ???   L210B                          
2133- 18                   CLC                                  
2134- D8                   CLD                                  
2135- 14 D5                TRB   $D5                            
2137- 2A                   ROL                                  
2138- D5 B6                CMP   $B6,X                          
213A- D5 CE                CMP   $CE,X                          
213C- D5 43                CMP   A4H,X                          
213E- D5 60                CMP   $60,X                          
2140- D5 EF                CMP   $EF,X                          
2142- D5 12                CMP   $12,X                          
2144- D6 5A                DEC   $5A,X                          
2146- D9 6A D9             CMP   $D96A,Y                        
2149- 7B                   ???                                  
214A- D9 68 18             CMP   $1868,Y                        
214D- 69 01                ADC   #$01                           
214F- 85 F2                STA   $F2                            
2151- 68                   PLA                                  
2152- 69 00                ADC   #$00                           
2154- 85 F3                STA   $F3                            
2156- A0 00                LDY   #$00                           
2158- 4C F1 00             JMP   $00F1                          
215B- 68                   PLA                                  
215C- 85 E7                STA   $E7                            
215E- 68                   PLA                                  
215F- 85 E8                STA   $E8                            
2161- A0 02                LDY   #$02                           
2163- B1 E7                LDA   ($E7),Y                        
2165- 85 F3                STA   $F3                            
2167- 88                   DEY                                  
2168- B1 E7                LDA   ($E7),Y                        
216A- 85 F2                STA   $F2                            
216C- 88                   DEY                                  
216D- 4C F1 00             JMP   $00F1                          
2170- EA                   NOP                                  
2171- EA                   NOP                                  
2172- EA                   NOP                                  
2173- EA                   NOP                                  
2174- EA                   NOP                                  
2175- EA                   NOP                                  
2176- EA                   NOP                                  
2177- EA                   NOP                                  
2178- EA                   NOP                                  
2179- EA                   NOP                                  
217A- EA                   NOP                                  
217B- EA                   NOP                                  
217C- EA                   NOP                                  
217D- EA                   NOP                                  
217E- EA                   NOP                                  
217F- EA                   NOP                                  
2180- EA                   NOP                                  
2181- EA                   NOP                                  
2182- EA                   NOP                                  
2183- EA                   NOP                                  
2184- EA                   NOP                                  
2185- AC C1 10             LDY   $10C1                          
2188- B9 C1 10  L2188      LDA   $10C1,Y                        
218B- 99 00 03             STA   $0300,Y                        
218E- 88                   DEY                                  
218F- 10 F7                BPL   L2188                          
2191- 2C 82 C0             BIT   PHASE1OFF                      
2194- A0 04                LDY   #$04                           
2196- B9 9A 10  L2196      LDA   $109A,Y                        
2199- 09 80                ORA   #$80                           
219B- 20 ED FD             JSR   COUT                           
219E- 88                   DEY                                  
219F- 10 F5                BPL   L2196                          
21A1- 2C 54 C0             BIT   PAGE2CLR                       
21A4- 2C 51 C0             BIT   TXTSET                         
21A7- 2C 5F C0             BIT   CLRAN3                         
21AA- 20 58 FC             JSR   HOME                           
21AD- A0 0F                LDY   #$0F                           
21AF- B9 AB 10  L21AF      LDA   $10AB,Y                        
21B2- 99 EF 00             STA   $00EF,Y                        
21B5- 88                   DEY                                  
21B6- 10 F7                BPL   L21AF                          
21B8- A9 4C                LDA   #$4C                           
21BA- 85 E6                STA   HPAG                           
21BC- A0 0C                LDY   #$0C                           
21BE- B9 B5 10  L21BE      LDA   $10B5,Y                        
21C1- 99 D0 03             STA   DOSWRM,Y                       
21C4- 88                   DEY                                  
21C5- 10 F7                BPL   L21BE                          
21C7- 20 00 BF             JSR   MLI                            
21CA- CC 98 10             CPY   $1098                          
21CD- D0 2A                BNE   L21F9                          
21CF- 20 00 BF             JSR   MLI                            
21D2- C8                   INY                                  
21D3- 8A                   TXA                                  
21D4- 10 D0                BPL   L21A6                          
21D6- 22 AD                ???   $AD                            
21D8- 8F 10                ???   L21EA                          
21DA- 8D 91 10             STA   $1091                          
21DD- 20 00 BF             JSR   MLI                            
21E0- CA                   DEX                                  
21E1- 90 10                BCC   L21F3                          
21E3- D0 14                BNE   L21F9                          
21E5- 20 00 BF             JSR   MLI                            
21E8- CC 98 10             CPY   $1098                          
21EB- D0 0C                BNE   L21F9                          
21ED- AD 00 03             LDA   $0300                          
21F0- 38                   SEC                                  
21F1- E9 03                SBC   #$03                           
21F3- 8D 00 03  L21F3      STA   $0300                          
21F6- 4C 00 20             JMP   L2000                          
21F9- EE F4 03  L21F9      INC   $03F4                          
21FC- A0 0B                LDY   #$0B                           
21FE- B9 9F 10  L21FE      LDA   $109F,Y                        
2201- 09 80                ORA   #$80                           
2203- 20 ED FD             JSR   COUT                           
2206- 88                   DEY                                  
2207- 10 F5                BPL   L21FE                          
2209- 20 0C FD             JSR   RDKEY                          
220C- 6C FC FF             JMP   ($FFFC)                        
220F- 03                   ???                                  
2210- 00                   BRK                                  
2211- 03                   ???                                  
2212- 00                   BRK                                  
2213- 08                   PHP                                  
2214- 00                   BRK                                  
2215- 04 00                TSB   $00                            
2217- 00                   BRK                                  
2218- 20 00 9F             JSR   $9F00                          
221B- 00                   BRK                                  
221C- 00                   BRK                                  
221D- 01 00                ORA   ($00,X)                        
221F- 15 0D                ORA   $0D,X                          
2221- 31 1A                AND   ($1A),Y                        
2223- 0D 2E 44             ORA   $442E                          
2226- 4D 43 20             EOR   L2043                          
2229- 47 4E                ???   RNDL                           
222B- 49 53                EOR   #$53                           
222D- 53                   ???                                  
222E- 49 4D                EOR   #$4D                           
2230- E8                   INX                                  
2231- C8                   INY                                  
2232- B9 FF FF             LDA   $FFFF,Y                        
2235- 85 F7                STA   $F7                            
2237- 6C 00 D0             JMP   ($D000)                        
223A- 2C 80 C0             BIT   PHASEOFF                       
223D- 4C C6 D0             JMP   $D0C6                          
2240- 2C 80 C0             BIT   PHASEOFF                       
2243- 4C D6 D0             JMP   $D0D6                          
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
2253- EA                   NOP                                  
2254- EA                   NOP                                  
2255- EA                   NOP                                  
2256- EA                   NOP                                  
2257- EA                   NOP                                  
2258- EA                   NOP                                  
2259- EA                   NOP                                  
225A- EA                   NOP                                  
225B- EA                   NOP                                  
225C- EA                   NOP                                  
225D- EA                   NOP                                  
225E- EA                   NOP                                  
225F- EA                   NOP                                  
2260- EA                   NOP                                  
2261- EA                   NOP                                  
2262- EA                   NOP                                  
2263- EA                   NOP                                  
2264- EA                   NOP                                  
2265- EA                   NOP                                  
2266- EA                   NOP                                  
2267- EA                   NOP                                  
2268- EA                   NOP                                  
2269- EA                   NOP                                  
226A- EA                   NOP                                  
226B- EA                   NOP                                  
226C- EA                   NOP                                  
226D- EA                   NOP                                  
226E- EA                   NOP                                  
226F- EA                   NOP                                  
2270- EA                   NOP                                  
2271- EA                   NOP                                  
2272- EA                   NOP                                  
2273- EA                   NOP                                  
2274- EA                   NOP                                  
2275- EA                   NOP                                  
2276- EA                   NOP                                  
2277- EA                   NOP                                  
2278- EA                   NOP                                  
2279- EA                   NOP                                  
227A- EA                   NOP                                  
227B- EA                   NOP                                  
227C- EA                   NOP                                  
227D- EA                   NOP                                  
227E- EA                   NOP                                  
227F- EA                   NOP                                  
2280- EA                   NOP                                  
2281- EA                   NOP                                  
2282- EA                   NOP                                  
2283- EA                   NOP                                  
2284- EA                   NOP                                  
2285- B5 C0                LDA   $C0,X                          
2287- 18                   CLC                                  
2288- 75 C1                ADC   $C1,X                          
228A- 95 C1                STA   $C1,X                          
228C- B5 A0                LDA   $A0,X                          
228E- 75 A1                ADC   $A1,X                          
2290- 95 A1                STA   $A1,X                          
2292- 4C EF 00             JMP   $00EF                          
2295- B5 C1                LDA   $C1,X                          
2297- 38                   SEC                                  
2298- F5 C0                SBC   $C0,X                          
229A- 95 C1                STA   $C1,X                          
229C- B5 A1                LDA   $A1,X                          
229E- F5 A0                SBC   $A0,X                          
22A0- 95 A1                STA   $A1,X                          
22A2- 4C EF 00             JMP   $00EF                          
22A5- B5 C0                LDA   $C0,X                          
22A7- 0A                   ASL                                  
22A8- 36 A0                ROL   $A0,X                          
22AA- 18                   CLC                                  
22AB- 75 C1                ADC   $C1,X                          
22AD- 95 C1                STA   $C1,X                          
22AF- B5 A0                LDA   $A0,X                          
22B1- 75 A1                ADC   $A1,X                          
22B3- 95 A1                STA   $A1,X                          
22B5- 4C EF 00             JMP   $00EF                          
22B8- 84 E4                STY   $E4                            
22BA- B5 A0                LDA   $A0,X                          
22BC- D5 A1                CMP   $A1,X                          
22BE- B0 0F                BCS   L22CF                          
22C0- A8                   TAY                                  
22C1- B5 A1                LDA   $A1,X                          
22C3- 95 A0                STA   $A0,X                          
22C5- 94 A1                STY   $A1,X                          
22C7- B4 C0                LDY   $C0,X                          
22C9- B5 C1                LDA   $C1,X                          
22CB- 95 C0                STA   $C0,X                          
22CD- 94 C1                STY   $C1,X                          
22CF- B5 C1     L22CF      LDA   $C1,X                          
22D1- 49 FF                EOR   #$FF                           
22D3- 85 E7                STA   $E7                            
22D5- A9 00                LDA   #$00                           
22D7- 95 C1                STA   $C1,X                          
22D9- A0 08                LDY   #$08                           
22DB- 46 E7     L22DB      LSR   $E7                            
22DD- B0 0C                BCS   L22EB                          
22DF- 85 E8                STA   $E8                            
22E1- B5 C1                LDA   $C1,X                          
22E3- 75 C0                ADC   $C0,X                          
22E5- 95 C1                STA   $C1,X                          
22E7- A5 E8                LDA   $E8                            
22E9- 75 A0                ADC   $A0,X                          
22EB- 16 C0     L22EB      ASL   $C0,X                          
22ED- 36 A0                ROL   $A0,X                          
22EF- 88                   DEY                                  
22F0- D0 E9                BNE   L22DB                          
22F2- F0 0F                BEQ   L2303                          
22F4- 18        L22F4      CLC                                  
22F5- A8                   TAY                                  
22F6- B5 C1                LDA   $C1,X                          
22F8- 75 C0                ADC   $C0,X                          
22FA- 95 C1                STA   $C1,X                          
22FC- 98                   TYA                                  
22FD- 75 A0                ADC   $A0,X                          
22FF- 16 C0     L22FF      ASL   $C0,X                          
2301- 36 A0                ROL   $A0,X                          
2303- 56 A1     L2303      LSR   $A1,X                          
2305- B0 ED                BCS   L22F4                          
2307- D0 F6                BNE   L22FF                          
2309- 95 A1                STA   $A1,X                          
230B- A4 E4                LDY   $E4                            
230D- 4C EF 00             JMP   $00EF                          
2310- A9 00                LDA   #$00                           
2312- 38                   SEC                                  
2313- F5 C0                SBC   $C0,X                          
2315- 95 C0                STA   $C0,X                          
2317- A9 00                LDA   #$00                           
2319- F5 A0                SBC   $A0,X                          
231B- 95 A0                STA   $A0,X                          
231D- 60                   RTS                                  
231E- 84 E4                STY   $E4                            
2320- A0 11                LDY   #$11                           
2322- A9 00                LDA   #$00                           
2324- 85 E7                STA   $E7                            
2326- 85 E8                STA   $E8                            
2328- 85 EA                STA   $EA                            
232A- B5 A1                LDA   $A1,X                          
232C- 10 09                BPL   L2337                          
232E- E8                   INX                                  
232F- 20 8B D2             JSR   $D28B                          
2332- CA                   DEX                                  
2333- A9 81                LDA   #$81                           
2335- 85 EA                STA   $EA                            
2337- 15 C1     L2337      ORA   $C1,X                          
2339- F0 2E                BEQ   L2369                          
233B- B5 A0                LDA   $A0,X                          
233D- 10 05                BPL   L2344                          
233F- 20 8B D2             JSR   $D28B                          
2342- E6 EA                INC   $EA                            
2344- 16 C1     L2344      ASL   $C1,X                          
2346- 36 A1                ROL   $A1,X                          
2348- 88                   DEY                                  
2349- 90 F9                BCC   L2344                          
234B- 26 E7     L234B      ROL   $E7                            
234D- 26 E8                ROL   $E8                            
234F- A5 E7                LDA   $E7                            
2351- D5 C0                CMP   $C0,X                          
2353- A5 E8                LDA   $E8                            
2355- F5 A0                SBC   $A0,X                          
2357- 90 09                BCC   L2362                          
2359- 85 E8                STA   $E8                            
235B- A5 E7                LDA   $E7                            
235D- F5 C0                SBC   $C0,X                          
235F- 85 E7                STA   $E7                            
2361- 38                   SEC                                  
2362- 36 C1     L2362      ROL   $C1,X                          
2364- 36 A1                ROL   $A1,X                          
2366- 88                   DEY                                  
2367- D0 E2                BNE   L234B                          
2369- E8        L2369      INX                                  
236A- A4 E4                LDY   $E4                            
236C- 60                   RTS                                  
236D- A9 00     L236D      LDA   #$00                           
236F- 38                   SEC                                  
2370- F5 C0                SBC   $C0,X                          
2372- 95 C0                STA   $C0,X                          
2374- A9 00                LDA   #$00                           
2376- F5 A0                SBC   $A0,X                          
2378- 95 A0                STA   $A0,X                          
237A- 4C F0 00             JMP   $00F0                          
237D- 20 99 D2             JSR   $D299                          
2380- 46 EA                LSR   $EA                            
2382- B0 E9                BCS   L236D                          
2384- 4C F0 00             JMP   $00F0                          
2387- 20 99 D2             JSR   $D299                          
238A- A5 E7                LDA   $E7                            
238C- 95 C0                STA   $C0,X                          
238E- A5 E8                LDA   $E8                            
2390- 95 A0                STA   $A0,X                          
2392- A5 EA                LDA   $EA                            
2394- 30 D7                BMI   L236D                          
2396- 4C F0 00             JMP   $00F0                          
2399- 20 99 D2             JSR   $D299                          
239C- 46 EA                LSR   $EA                            
239E- 90 03                BCC   L23A3                          
23A0- 20 8B D2             JSR   $D28B                          
23A3- CA        L23A3      DEX                                  
23A4- A5 E7                LDA   $E7                            
23A6- 95 C0                STA   $C0,X                          
23A8- A5 E8                LDA   $E8                            
23AA- 95 A0                STA   $A0,X                          
23AC- 06 EA                ASL   $EA                            
23AE- 30 BD                BMI   L236D                          
23B0- 4C F0 00             JMP   $00F0                          
23B3- F6 C0                INC   $C0,X                          
23B5- F0 03                BEQ   L23BA                          
23B7- 4C F0 00             JMP   $00F0                          
23BA- F6 A0     L23BA      INC   $A0,X                          
23BC- 4C F0 00             JMP   $00F0                          
23BF- B5 C0                LDA   $C0,X                          
23C1- F0 05                BEQ   L23C8                          
23C3- D6 C0                DEC   $C0,X                          
23C5- 4C F0 00             JMP   $00F0                          
23C8- D6 C0     L23C8      DEC   $C0,X                          
23CA- D6 A0                DEC   $A0,X                          
23CC- 4C F0 00             JMP   $00F0                          
23CF- A9 FF                LDA   #$FF                           
23D1- 55 C0                EOR   $C0,X                          
23D3- 95 C0                STA   $C0,X                          
23D5- A9 FF                LDA   #$FF                           
23D7- 55 A0                EOR   $A0,X                          
23D9- 95 A0                STA   $A0,X                          
23DB- 4C F0 00             JMP   $00F0                          
23DE- B5 C1                LDA   $C1,X                          
23E0- 35 C0                AND   $C0,X                          
23E2- 95 C1                STA   $C1,X                          
23E4- B5 A1                LDA   $A1,X                          
23E6- 35 A0                AND   $A0,X                          
23E8- 95 A1                STA   $A1,X                          
23EA- 4C EF 00             JMP   $00EF                          
23ED- B5 C1                LDA   $C1,X                          
23EF- 15 C0                ORA   $C0,X                          
23F1- 95 C1                STA   $C1,X                          
23F3- B5 A1                LDA   $A1,X                          
23F5- 15 A0                ORA   $A0,X                          
23F7- 95 A1                STA   $A1,X                          
23F9- 4C EF 00             JMP   $00EF                          
23FC- B5 C1                LDA   $C1,X                          
23FE- 55 C0                EOR   $C0,X                          
2400- 95 C1                STA   $C1,X                          
2402- B5 A1                LDA   $A1,X                          
2404- 55 A0                EOR   $A0,X                          
2406- 95 A1                STA   $A1,X                          
2408- 4C EF 00             JMP   $00EF                          
240B- 84 E4                STY   $E4                            
240D- B5 C0                LDA   $C0,X                          
240F- C9 08                CMP   #$08                           
2411- 90 0A                BCC   L241D                          
2413- B4 C1                LDY   $C1,X                          
2415- 94 A1                STY   $A1,X                          
2417- A0 00                LDY   #$00                           
2419- 94 C1                STY   $C1,X                          
241B- E9 08                SBC   #$08                           
241D- A8        L241D      TAY                                  
241E- F0 0A                BEQ   L242A                          
2420- B5 C1                LDA   $C1,X                          
2422- 0A        L2422      ASL                                  
2423- 36 A1                ROL   $A1,X                          
2425- 88                   DEY                                  
2426- D0 FA                BNE   L2422                          
2428- 95 C1                STA   $C1,X                          
242A- A4 E4     L242A      LDY   $E4                            
242C- 4C EF 00             JMP   $00EF                          
242F- 84 E4                STY   $E4                            
2431- B5 C0                LDA   $C0,X                          
2433- C9 08                CMP   #$08                           
2435- 90 10                BCC   L2447                          
2437- B4 A1                LDY   $A1,X                          
2439- 94 C1                STY   $C1,X                          
243B- C0 80                CPY   #$80                           
243D- A0 00                LDY   #$00                           
243F- 90 01                BCC   L2442                          
2441- 88                   DEY                                  
2442- 94 A1     L2442      STY   $A1,X                          
2444- 38                   SEC                                  
2445- E9 08                SBC   #$08                           
2447- A8        L2447      TAY                                  
2448- F0 0C                BEQ   L2456                          
244A- B5 A1                LDA   $A1,X                          
244C- C9 80     L244C      CMP   #$80                           
244E- 6A                   ROR                                  
244F- 76 C1                ROR   $C1,X                          
2451- 88                   DEY                                  
2452- D0 F8                BNE   L244C                          
2454- 95 A1                STA   $A1,X                          
2456- A4 E4     L2456      LDY   $E4                            
2458- 4C EF 00             JMP   $00EF                          
245B- CA                   DEX                                  
245C- B5 C1                LDA   $C1,X                          
245E- 95 C0                STA   $C0,X                          
2460- B5 A1                LDA   $A1,X                          
2462- 95 A0                STA   $A0,X                          
2464- 4C F0 00             JMP   $00F0                          
2467- C8                   INY                                  
2468- B1 F2                LDA   ($F2),Y                        
246A- 18                   CLC                                  
246B- 75 C0                ADC   $C0,X                          
246D- 95 C0                STA   $C0,X                          
246F- 90 02                BCC   L2473                          
2471- F6 A0                INC   $A0,X                          
2473- 4C F0 00  L2473      JMP   $00F0                          
2476- C8                   INY                                  
2477- B5 C0                LDA   $C0,X                          
2479- 38                   SEC                                  
247A- F1 F2                SBC   ($F2),Y                        
247C- 95 C0                STA   $C0,X                          
247E- B0 02                BCS   L2482                          
2480- D6 A0                DEC   $A0,X                          
2482- 4C F0 00  L2482      JMP   $00F0                          
2485- C8                   INY                                  
2486- B1 F2                LDA   ($F2),Y                        
2488- 35 C0                AND   $C0,X                          
248A- 95 C0                STA   $C0,X                          
248C- A9 00                LDA   #$00                           
248E- 95 A0                STA   $A0,X                          
2490- 4C F0 00             JMP   $00F0                          
2493- C8                   INY                                  
2494- B1 F2                LDA   ($F2),Y                        
2496- 15 C0                ORA   $C0,X                          
2498- 95 C0                STA   $C0,X                          
249A- 4C F0 00             JMP   $00F0                          
249D- B5 C0                LDA   $C0,X                          
249F- 15 A0                ORA   $A0,X                          
24A1- F0 0A                BEQ   L24AD                          
24A3- A9 00                LDA   #$00                           
24A5- 95 C0                STA   $C0,X                          
24A7- 95 A0                STA   $A0,X                          
24A9- 4C F0 00             JMP   $00F0                          
24AC- CA                   DEX                                  
24AD- A9 FF     L24AD      LDA   #$FF                           
24AF- 95 C0                STA   $C0,X                          
24B1- 95 A0                STA   $A0,X                          
24B3- 4C F0 00             JMP   $00F0                          
24B6- CA                   DEX                                  
24B7- 95 C0                STA   $C0,X                          
24B9- 95 A0                STA   $A0,X                          
24BB- 4C F0 00             JMP   $00F0                          
24BE- CA                   DEX                                  
24BF- 4A                   LSR                                  
24C0- 95 C0                STA   $C0,X                          
24C2- A9 00                LDA   #$00                           
24C4- 95 A0                STA   $A0,X                          
24C6- 4C F0 00             JMP   $00F0                          
24C9- CA                   DEX                                  
24CA- A9 00                LDA   #$00                           
24CC- 95 A0                STA   $A0,X                          
24CE- C8                   INY                                  
24CF- B1 F2                LDA   ($F2),Y                        
24D1- 95 C0                STA   $C0,X                          
24D3- 4C F0 00             JMP   $00F0                          
24D6- CA                   DEX                                  
24D7- A9 FF                LDA   #$FF                           
24D9- 95 A0                STA   $A0,X                          
24DB- C8                   INY                                  
24DC- B1 F2                LDA   ($F2),Y                        
24DE- 95 C0                STA   $C0,X                          
24E0- 4C F0 00             JMP   $00F0                          
24E3- 98        L24E3      TYA                                  
24E4- 18                   CLC                                  
24E5- 65 F2                ADC   $F2                            
24E7- 85 F2                STA   $F2                            
24E9- 90 02                BCC   L24ED                          
24EB- E6 F3                INC   $F3                            
24ED- A0 FF     L24ED      LDY   #$FF                           
24EF- C8                   INY                                  
24F0- 30 F1                BMI   L24E3                          
24F2- CA                   DEX                                  
24F3- B1 F2                LDA   ($F2),Y                        
24F5- 95 C0                STA   $C0,X                          
24F7- C8                   INY                                  
24F8- B1 F2                LDA   ($F2),Y                        
24FA- 95 A0                STA   $A0,X                          
24FC- 4C F0 00             JMP   $00F0                          
24FF- CA                   DEX                                  
2500- C8                   INY                                  
2501- B1 F2                LDA   ($F2),Y                        
2503- 95 C0                STA   $C0,X                          
2505- C8                   INY                                  
2506- B1 F2                LDA   ($F2),Y                        
2508- 95 A0                STA   $A0,X                          
250A- 4C F0 00             JMP   $00F0                          
250D- CA                   DEX                                  
250E- 98                   TYA                                  
250F- 38                   SEC                                  
2510- 65 F2                ADC   $F2                            
2512- 85 F2                STA   $F2                            
2514- 95 C0                STA   $C0,X                          
2516- A9 00                LDA   #$00                           
2518- A8                   TAY                                  
2519- 65 F3                ADC   $F3                            
251B- 85 F3                STA   $F3                            
251D- 95 A0                STA   $A0,X                          
251F- B1 F2                LDA   ($F2),Y                        
2521- A8                   TAY                                  
2522- 4C F0 00             JMP   $00F0                          
2525- B5 C0                LDA   $C0,X                          
2527- 95 9F                STA   $9F,X                          
2529- A1 9F                LDA   ($9F,X)                        
252B- 95 C0                STA   $C0,X                          
252D- A9 00                LDA   #$00                           
252F- 95 A0                STA   $A0,X                          
2531- 4C F0 00             JMP   $00F0                          
2534- B5 C0                LDA   $C0,X                          
2536- 95 9F                STA   $9F,X                          
2538- A1 9F                LDA   ($9F,X)                        
253A- 95 C0                STA   $C0,X                          
253C- F6 9F                INC   $9F,X                          
253E- F0 07                BEQ   L2547                          
2540- A1 9F                LDA   ($9F,X)                        
2542- 95 A0                STA   $A0,X                          
2544- 4C F0 00             JMP   $00F0                          
2547- F6 A0     L2547      INC   $A0,X                          
2549- A1 9F                LDA   ($9F,X)                        
254B- 95 A0                STA   $A0,X                          
254D- 4C F0 00             JMP   $00F0                          
2550- 98        L2550      TYA                                  
2551- 18                   CLC                                  
2552- 65 F2                ADC   $F2                            
2554- 85 F2                STA   $F2                            
2556- 90 02                BCC   L255A                          
2558- E6 F3                INC   $F3                            
255A- A0 FF     L255A      LDY   #$FF                           
255C- C8                   INY                                  
255D- 30 F1                BMI   L2550                          
255F- B1 F2                LDA   ($F2),Y                        
2561- CA                   DEX                                  
2562- 18                   CLC                                  
2563- 65 E0                ADC   XO                             
2565- 95 C0                STA   $C0,X                          
2567- A9 00                LDA   #$00                           
2569- 65 E1                ADC   $E1                            
256B- 95 A0                STA   $A0,X                          
256D- 4C F0 00             JMP   $00F0                          
2570- C8                   INY                                  
2571- B1 F2                LDA   ($F2),Y                        
2573- 84 E4                STY   $E4                            
2575- A8                   TAY                                  
2576- CA                   DEX                                  
2577- B1 E0                LDA   (XO),Y                         
2579- 95 C0                STA   $C0,X                          
257B- A9 00                LDA   #$00                           
257D- 95 A0                STA   $A0,X                          
257F- A4 E4                LDY   $E4                            
2581- 4C F0 00             JMP   $00F0                          
2584- C8                   INY                                  
2585- B1 F2                LDA   ($F2),Y                        
2587- 84 E4                STY   $E4                            
2589- A8                   TAY                                  
258A- CA                   DEX                                  
258B- B1 E0                LDA   (XO),Y                         
258D- 95 C0                STA   $C0,X                          
258F- C8                   INY                                  
2590- B1 E0                LDA   (XO),Y                         
2592- 95 A0                STA   $A0,X                          
2594- A4 E4                LDY   $E4                            
2596- 4C F0 00             JMP   $00F0                          
2599- C8                   INY                                  
259A- B1 F2                LDA   ($F2),Y                        
259C- 84 E4                STY   $E4                            
259E- A8                   TAY                                  
259F- B1 E0                LDA   (XO),Y                         
25A1- 18                   CLC                                  
25A2- 75 C0                ADC   $C0,X                          
25A4- 95 C0                STA   $C0,X                          
25A6- 90 02                BCC   L25AA                          
25A8- F6 A0                INC   $A0,X                          
25AA- A4 E4     L25AA      LDY   $E4                            
25AC- 4C F0 00             JMP   $00F0                          
25AF- C8                   INY                                  
25B0- B1 F2                LDA   ($F2),Y                        
25B2- 84 E4                STY   $E4                            
25B4- A8                   TAY                                  
25B5- B1 E0                LDA   (XO),Y                         
25B7- 18                   CLC                                  
25B8- 75 C0                ADC   $C0,X                          
25BA- 95 C0                STA   $C0,X                          
25BC- C8                   INY                                  
25BD- B1 E0                LDA   (XO),Y                         
25BF- 75 A0                ADC   $A0,X                          
25C1- 95 A0                STA   $A0,X                          
25C3- A4 E4                LDY   $E4                            
25C5- 4C F0 00             JMP   $00F0                          
25C8- C8                   INY                                  
25C9- B1 F2                LDA   ($F2),Y                        
25CB- 84 E4                STY   $E4                            
25CD- A8                   TAY                                  
25CE- B1 E0                LDA   (XO),Y                         
25D0- A0 00                LDY   #$00                           
25D2- 0A                   ASL                                  
25D3- 90 02                BCC   L25D7                          
25D5- C8                   INY                                  
25D6- 18                   CLC                                  
25D7- 75 C0     L25D7      ADC   $C0,X                          
25D9- 95 C0                STA   $C0,X                          
25DB- 98                   TYA                                  
25DC- 75 A0                ADC   $A0,X                          
25DE- 95 A0                STA   $A0,X                          
25E0- A4 E4                LDY   $E4                            
25E2- 4C F0 00             JMP   $00F0                          
25E5- C8                   INY                                  
25E6- B1 F2                LDA   ($F2),Y                        
25E8- 84 E4                STY   $E4                            
25EA- A8                   TAY                                  
25EB- B1 E0                LDA   (XO),Y                         
25ED- 0A                   ASL                                  
25EE- 85 E7                STA   $E7                            
25F0- C8                   INY                                  
25F1- B1 E0                LDA   (XO),Y                         
25F3- 2A                   ROL                                  
25F4- 85 E8                STA   $E8                            
25F6- A5 E7                LDA   $E7                            
25F8- 18                   CLC                                  
25F9- 75 C0                ADC   $C0,X                          
25FB- 95 C0                STA   $C0,X                          
25FD- A5 E8                LDA   $E8                            
25FF- 75 A0                ADC   $A0,X                          
2601- 95 A0                STA   $A0,X                          
2603- A4 E4                LDY   $E4                            
2605- 4C F0 00             JMP   $00F0                          
2608- C8                   INY                                  
2609- B1 F2                LDA   ($F2),Y                        
260B- 95 9E                STA   $9E,X                          
260D- C8                   INY                                  
260E- B1 F2                LDA   ($F2),Y                        
2610- 95 9F                STA   $9F,X                          
2612- A1 9E                LDA   ($9E,X)                        
2614- CA                   DEX                                  
2615- 95 C0                STA   $C0,X                          
2617- A9 00                LDA   #$00                           
2619- 95 A0                STA   $A0,X                          
261B- 4C F0 00             JMP   $00F0                          
261E- C8                   INY                                  
261F- B1 F2                LDA   ($F2),Y                        
2621- 85 E7                STA   $E7                            
2623- C8                   INY                                  
2624- B1 F2                LDA   ($F2),Y                        
2626- 85 E8                STA   $E8                            
2628- 84 E4                STY   $E4                            
262A- A0 00                LDY   #$00                           
262C- B1 E7                LDA   ($E7),Y                        
262E- CA                   DEX                                  
262F- 95 C0                STA   $C0,X                          
2631- C8                   INY                                  
2632- B1 E7                LDA   ($E7),Y                        
2634- 95 A0                STA   $A0,X                          
2636- A4 E4                LDY   $E4                            
2638- 4C F0 00             JMP   $00F0                          
263B- C8                   INY                                  
263C- B1 F2                LDA   ($F2),Y                        
263E- 95 9E                STA   $9E,X                          
2640- C8                   INY                                  
2641- B1 F2                LDA   ($F2),Y                        
2643- 95 9F                STA   $9F,X                          
2645- A1 9E                LDA   ($9E,X)                        
2647- 18                   CLC                                  
2648- 75 C0                ADC   $C0,X                          
264A- 95 C0                STA   $C0,X                          
264C- 90 02                BCC   L2650                          
264E- F6 A0                INC   $A0,X                          
2650- 4C F0 00  L2650      JMP   $00F0                          
2653- C8                   INY                                  
2654- B1 F2                LDA   ($F2),Y                        
2656- 85 06                STA   $06                            
2658- C8                   INY                                  
2659- B1 F2                LDA   ($F2),Y                        
265B- 85 07                STA   $07                            
265D- 84 E4                STY   $E4                            
265F- A0 00                LDY   #$00                           
2661- B1 06                LDA   ($06),Y                        
2663- 18                   CLC                                  
2664- 75 C0                ADC   $C0,X                          
2666- 95 C0                STA   $C0,X                          
2668- C8                   INY                                  
2669- B1 06                LDA   ($06),Y                        
266B- 75 A0                ADC   $A0,X                          
266D- 95 A0                STA   $A0,X                          
266F- A4 E4                LDY   $E4                            
2671- 4C F0 00             JMP   $00F0                          
2674- C8                   INY                                  
2675- B1 F2                LDA   ($F2),Y                        
2677- 95 9E                STA   $9E,X                          
2679- C8                   INY                                  
267A- B1 F2                LDA   ($F2),Y                        
267C- 95 9F                STA   $9F,X                          
267E- A1 9E                LDA   ($9E,X)                        
2680- 84 E4                STY   $E4                            
2682- A0 00                LDY   #$00                           
2684- 0A                   ASL                                  
2685- 90 02                BCC   L2689                          
2687- C8                   INY                                  
2688- 18                   CLC                                  
2689- 75 C0     L2689      ADC   $C0,X                          
268B- 95 C0                STA   $C0,X                          
268D- 98                   TYA                                  
268E- 75 A0                ADC   $A0,X                          
2690- 95 A0                STA   $A0,X                          
2692- A4 E4                LDY   $E4                            
2694- 4C F0 00             JMP   $00F0                          
2697- C8                   INY                                  
2698- B1 F2                LDA   ($F2),Y                        
269A- 85 06                STA   $06                            
269C- C8                   INY                                  
269D- B1 F2                LDA   ($F2),Y                        
269F- 85 07                STA   $07                            
26A1- 84 E4                STY   $E4                            
26A3- A0 00                LDY   #$00                           
26A5- B1 06                LDA   ($06),Y                        
26A7- 0A                   ASL                                  
26A8- 85 E7                STA   $E7                            
26AA- C8                   INY                                  
26AB- B1 06                LDA   ($06),Y                        
26AD- 2A                   ROL                                  
26AE- 85 E8                STA   $E8                            
26B0- A5 E7                LDA   $E7                            
26B2- 18                   CLC                                  
26B3- 75 C0                ADC   $C0,X                          
26B5- 95 C0                STA   $C0,X                          
26B7- A5 E8                LDA   $E8                            
26B9- 75 A0                ADC   $A0,X                          
26BB- 95 A0                STA   $A0,X                          
26BD- A4 E4                LDY   $E4                            
26BF- 4C F0 00             JMP   $00F0                          
26C2- B5 C0                LDA   $C0,X                          
26C4- 95 9F                STA   $9F,X                          
26C6- B5 C1                LDA   $C1,X                          
26C8- 81 9F                STA   ($9F,X)                        
26CA- E8                   INX                                  
26CB- 4C EF 00             JMP   $00EF                          
26CE- B5 C0                LDA   $C0,X                          
26D0- 95 9F                STA   $9F,X                          
26D2- B5 C1                LDA   $C1,X                          
26D4- 81 9F                STA   ($9F,X)                        
26D6- B5 A1                LDA   $A1,X                          
26D8- F6 9F                INC   $9F,X                          
26DA- F0 06                BEQ   L26E2                          
26DC- 81 9F                STA   ($9F,X)                        
26DE- E8                   INX                                  
26DF- 4C EF 00             JMP   $00EF                          
26E2- F6 A0     L26E2      INC   $A0,X                          
26E4- 81 9F                STA   ($9F,X)                        
26E6- E8                   INX                                  
26E7- 4C EF 00             JMP   $00EF                          
26EA- C8                   INY                                  
26EB- B1 F2                LDA   ($F2),Y                        
26ED- 84 E4                STY   $E4                            
26EF- A8                   TAY                                  
26F0- B5 C0                LDA   $C0,X                          
26F2- 91 E0                STA   (XO),Y                         
26F4- A4 E4                LDY   $E4                            
26F6- 30 19                BMI   L2711                          
26F8- 4C EF 00             JMP   $00EF                          
26FB- C8                   INY                                  
26FC- B1 F2                LDA   ($F2),Y                        
26FE- 84 E4                STY   $E4                            
2700- A8                   TAY                                  
2701- B5 C0                LDA   $C0,X                          
2703- 91 E0                STA   (XO),Y                         
2705- C8                   INY                                  
2706- B5 A0                LDA   $A0,X                          
2708- 91 E0                STA   (XO),Y                         
270A- A4 E4                LDY   $E4                            
270C- 30 03                BMI   L2711                          
270E- 4C EF 00             JMP   $00EF                          
2711- 98        L2711      TYA                                  
2712- A0 00                LDY   #$00                           
2714- 18                   CLC                                  
2715- 65 F2                ADC   $F2                            
2717- 85 F2                STA   $F2                            
2719- 90 02                BCC   L271D                          
271B- E6 F3                INC   $F3                            
271D- 4C EF 00  L271D      JMP   $00EF                          
2720- C8                   INY                                  
2721- B1 F2                LDA   ($F2),Y                        
2723- 84 E4                STY   $E4                            
2725- A8                   TAY                                  
2726- B5 C0                LDA   $C0,X                          
2728- 91 E0                STA   (XO),Y                         
272A- A9 00                LDA   #$00                           
272C- 95 A0                STA   $A0,X                          
272E- A4 E4                LDY   $E4                            
2730- 4C F0 00             JMP   $00F0                          
2733- C8                   INY                                  
2734- B1 F2                LDA   ($F2),Y                        
2736- 84 E4                STY   $E4                            
2738- A8                   TAY                                  
2739- B5 C0                LDA   $C0,X                          
273B- 91 E0                STA   (XO),Y                         
273D- C8                   INY                                  
273E- B5 A0                LDA   $A0,X                          
2740- 91 E0                STA   (XO),Y                         
2742- A4 E4                LDY   $E4                            
2744- 4C F0 00             JMP   $00F0                          
2747- 98        L2747      TYA                                  
2748- 18                   CLC                                  
2749- 65 F2                ADC   $F2                            
274B- 85 F2                STA   $F2                            
274D- 90 02                BCC   L2751                          
274F- E6 F3                INC   $F3                            
2751- A0 FF     L2751      LDY   #$FF                           
2753- C8                   INY                                  
2754- 30 F1                BMI   L2747                          
2756- B1 F2                LDA   ($F2),Y                        
2758- 95 9E                STA   $9E,X                          
275A- C8                   INY                                  
275B- B1 F2                LDA   ($F2),Y                        
275D- 95 9F                STA   $9F,X                          
275F- B5 C0                LDA   $C0,X                          
2761- 81 9E                STA   ($9E,X)                        
2763- 4C EF 00             JMP   $00EF                          
2766- C8                   INY                                  
2767- B1 F2                LDA   ($F2),Y                        
2769- 85 E7                STA   $E7                            
276B- C8                   INY                                  
276C- B1 F2                LDA   ($F2),Y                        
276E- 85 E8                STA   $E8                            
2770- 84 E4                STY   $E4                            
2772- A0 00                LDY   #$00                           
2774- B5 C0                LDA   $C0,X                          
2776- 91 E7                STA   ($E7),Y                        
2778- C8                   INY                                  
2779- B5 A0                LDA   $A0,X                          
277B- 91 E7                STA   ($E7),Y                        
277D- A4 E4                LDY   $E4                            
277F- 30 03                BMI   L2784                          
2781- 4C EF 00             JMP   $00EF                          
2784- 4C 8C D6  L2784      JMP   $D68C                          
2787- C8                   INY                                  
2788- B1 F2                LDA   ($F2),Y                        
278A- 95 9E                STA   $9E,X                          
278C- C8                   INY                                  
278D- B1 F2                LDA   ($F2),Y                        
278F- 95 9F                STA   $9F,X                          
2791- B5 C0                LDA   $C0,X                          
2793- 81 9E                STA   ($9E,X)                        
2795- A9 00                LDA   #$00                           
2797- 95 A0                STA   $A0,X                          
2799- 4C F0 00             JMP   $00F0                          
279C- C8                   INY                                  
279D- B1 F2                LDA   ($F2),Y                        
279F- 85 E7                STA   $E7                            
27A1- C8                   INY                                  
27A2- B1 F2                LDA   ($F2),Y                        
27A4- 85 E8                STA   $E8                            
27A6- 84 E4                STY   $E4                            
27A8- A0 00                LDY   #$00                           
27AA- B5 C0                LDA   $C0,X                          
27AC- 91 E7                STA   ($E7),Y                        
27AE- C8                   INY                                  
27AF- B5 A0                LDA   $A0,X                          
27B1- 91 E7                STA   ($E7),Y                        
27B3- A4 E4                LDY   $E4                            
27B5- 4C F0 00             JMP   $00F0                          
27B8- B5 C0                LDA   $C0,X                          
27BA- D5 C1                CMP   $C1,X                          
27BC- D0 1B                BNE   L27D9                          
27BE- B5 A0                LDA   $A0,X                          
27C0- D5 A1                CMP   $A1,X                          
27C2- D0 15                BNE   L27D9                          
27C4- A9 FF     L27C4      LDA   #$FF                           
27C6- 95 C1                STA   $C1,X                          
27C8- 95 A1                STA   $A1,X                          
27CA- 4C EF 00             JMP   $00EF                          
27CD- B5 C0                LDA   $C0,X                          
27CF- D5 C1                CMP   $C1,X                          
27D1- D0 F1                BNE   L27C4                          
27D3- B5 A0                LDA   $A0,X                          
27D5- D5 A1                CMP   $A1,X                          
27D7- D0 EB                BNE   L27C4                          
27D9- A9 00     L27D9      LDA   #$00                           
27DB- 95 C1                STA   $C1,X                          
27DD- 95 A1                STA   $A1,X                          
27DF- 4C EF 00             JMP   $00EF                          
27E2- B5 C1                LDA   $C1,X                          
27E4- D5 C0                CMP   $C0,X                          
27E6- B5 A1                LDA   $A1,X                          
27E8- F5 A0                SBC   $A0,X                          
27EA- 70 04                BVS   L27F0                          
27EC- 10 D6                BPL   L27C4                          
27EE- 30 E9                BMI   L27D9                          
27F0- 10 E7     L27F0      BPL   L27D9                          
27F2- 30 D0                BMI   L27C4                          
27F4- B5 C0                LDA   $C0,X                          
27F6- D5 C1                CMP   $C1,X                          
27F8- B5 A0                LDA   $A0,X                          
27FA- F5 A1                SBC   $A1,X                          
27FC- 70 F2                BVS   L27F0                          
27FE- 10 C4                BPL   L27C4                          
2800- 30 D7                BMI   L27D9                          
2802- B5 C0                LDA   $C0,X                          
2804- D5 C1                CMP   $C1,X                          
2806- B5 A0                LDA   $A0,X                          
2808- F5 A1                SBC   $A1,X                          
280A- 70 04                BVS   L2810                          
280C- 30 B6                BMI   L27C4                          
280E- 10 C9                BPL   L27D9                          
2810- 30 C7     L2810      BMI   L27D9                          
2812- 10 B0                BPL   L27C4                          
2814- B5 C1                LDA   $C1,X                          
2816- D5 C0                CMP   $C0,X                          
2818- B5 A1                LDA   $A1,X                          
281A- F5 A0                SBC   $A0,X                          
281C- 70 F2                BVS   L2810                          
281E- 30 A4                BMI   L27C4                          
2820- 10 B7                BPL   L27D9                          
2822- E8                   INX                                  
2823- 98                   TYA                                  
2824- 38                   SEC                                  
2825- 65 F2                ADC   $F2                            
2827- 85 E7                STA   $E7                            
2829- A9 00                LDA   #$00                           
282B- A8                   TAY                                  
282C- 65 F3                ADC   $F3                            
282E- 85 E8                STA   $E8                            
2830- B1 E7                LDA   ($E7),Y                        
2832- 65 E7                ADC   $E7                            
2834- 85 F2                STA   $F2                            
2836- C8                   INY                                  
2837- B1 E7                LDA   ($E7),Y                        
2839- 65 E8                ADC   $E8                            
283B- 85 F3                STA   $F3                            
283D- 88                   DEY                                  
283E- B1 F2                LDA   ($F2),Y                        
2840- 85 E7                STA   $E7                            
2842- E6 F2                INC   $F2                            
2844- D0 02                BNE   L2848                          
2846- E6 F3                INC   $F3                            
2848- B5 BF     L2848      LDA   $BF,X                          
284A- D1 F2                CMP   ($F2),Y                        
284C- F0 14                BEQ   L2862                          
284E- B5 9F                LDA   $9F,X                          
2850- C8                   INY                                  
2851- F1 F2                SBC   ($F2),Y                        
2853- 30 16                BMI   L286B                          
2855- C8        L2855      INY                                  
2856- C8                   INY                                  
2857- C6 E7                DEC   $E7                            
2859- F0 2A                BEQ   L2885                          
285B- C8                   INY                                  
285C- D0 EA                BNE   L2848                          
285E- E6 F3                INC   $F3                            
2860- D0 E6                BNE   L2848                          
2862- B5 9F     L2862      LDA   $9F,X                          
2864- C8                   INY                                  
2865- F1 F2                SBC   ($F2),Y                        
2867- F0 72                BEQ   L28DB                          
2869- 10 EA                BPL   L2855                          
286B- A9 00     L286B      LDA   #$00                           
286D- 85 E8                STA   $E8                            
286F- C6 E7                DEC   $E7                            
2871- A5 E7                LDA   $E7                            
2873- 0A                   ASL                                  
2874- 26 E8                ROL   $E8                            
2876- 0A                   ASL                                  
2877- 26 E8                ROL   $E8                            
2879- 65 F2                ADC   $F2                            
287B- 85 F2                STA   $F2                            
287D- A5 E8                LDA   $E8                            
287F- 65 F3                ADC   $F3                            
2881- 85 F3                STA   $F3                            
2883- C8                   INY                                  
2884- C8                   INY                                  
2885- 98        L2885      TYA                                  
2886- A0 00                LDY   #$00                           
2888- 38                   SEC                                  
2889- 65 F2                ADC   $F2                            
288B- 85 F2                STA   $F2                            
288D- 90 02                BCC   L2891                          
288F- E6 F3                INC   $F3                            
2891- 4C F1 00  L2891      JMP   $00F1                          
2894- B5 C0                LDA   $C0,X                          
2896- 15 A0                ORA   $A0,X                          
2898- F0 41                BEQ   L28DB                          
289A- E8                   INX                                  
289B- D0 30                BNE   L28CD                          
289D- B5 C0                LDA   $C0,X                          
289F- 15 A0                ORA   $A0,X                          
28A1- D0 38                BNE   L28DB                          
28A3- E8                   INX                                  
28A4- D0 27                BNE   L28CD                          
28A6- E8                   INX                                  
28A7- E8                   INX                                  
28A8- B5 BE                LDA   $BE,X                          
28AA- D5 BF                CMP   $BF,X                          
28AC- D0 1F                BNE   L28CD                          
28AE- B5 9E                LDA   $9E,X                          
28B0- D5 9F                CMP   $9F,X                          
28B2- F0 27                BEQ   L28DB                          
28B4- D0 17                BNE   L28CD                          
28B6- E8                   INX                                  
28B7- E8                   INX                                  
28B8- B5 BE                LDA   $BE,X                          
28BA- D5 BF                CMP   $BF,X                          
28BC- D0 1D                BNE   L28DB                          
28BE- B5 9E                LDA   $9E,X                          
28C0- D5 9F                CMP   $9F,X                          
28C2- D0 17                BNE   L28DB                          
28C4- F0 07                BEQ   L28CD                          
28C6- E8                   INX                                  
28C7- B5 9F                LDA   $9F,X                          
28C9- 15 BF                ORA   $BF,X                          
28CB- D0 0E                BNE   L28DB                          
28CD- C8        L28CD      INY                                  
28CE- C8                   INY                                  
28CF- 30 B4                BMI   L2885                          
28D1- 4C F0 00             JMP   $00F0                          
28D4- E8                   INX                                  
28D5- B5 9F                LDA   $9F,X                          
28D7- 15 BF                ORA   $BF,X                          
28D9- D0 F2                BNE   L28CD                          
28DB- 98        L28DB      TYA                                  
28DC- 38                   SEC                                  
28DD- 65 F2                ADC   $F2                            
28DF- 85 E7                STA   $E7                            
28E1- A9 00                LDA   #$00                           
28E3- A8                   TAY                                  
28E4- 65 F3                ADC   $F3                            
28E6- 85 E8                STA   $E8                            
28E8- B1 E7                LDA   ($E7),Y                        
28EA- 65 E7                ADC   $E7                            
28EC- 85 F2                STA   $F2                            
28EE- C8                   INY                                  
28EF- B1 E7                LDA   ($E7),Y                        
28F1- 65 E8                ADC   $E8                            
28F3- 85 F3                STA   $F3                            
28F5- 88                   DEY                                  
28F6- 4C F1 00             JMP   $00F1                          
28F9- B5 C1                LDA   $C1,X                          
28FB- D5 C0                CMP   $C0,X                          
28FD- B5 A1                LDA   $A1,X                          
28FF- F5 A0                SBC   $A0,X                          
2901- 70 12                BVS   L2915                          
2903- 10 C8                BPL   L28CD                          
2905- 30 D4                BMI   L28DB                          
2907- B5 C0                LDA   $C0,X                          
2909- D5 C1                CMP   $C1,X                          
290B- B5 A0                LDA   $A0,X                          
290D- F5 A1                SBC   $A1,X                          
290F- 70 04                BVS   L2915                          
2911- 10 BA                BPL   L28CD                          
2913- 30 C6                BMI   L28DB                          
2915- 30 B6     L2915      BMI   L28CD                          
2917- 10 C2                BPL   L28DB                          
2919- D6 C0                DEC   $C0,X                          
291B- B5 C0                LDA   $C0,X                          
291D- C9 FF                CMP   #$FF                           
291F- D0 04                BNE   L2925                          
2921- D6 A0                DEC   $A0,X                          
2923- B5 C0     L2923      LDA   $C0,X                          
2925- D5 C1     L2925      CMP   $C1,X                          
2927- B5 A0                LDA   $A0,X                          
2929- F5 A1                SBC   $A1,X                          
292B- 70 18                BVS   L2945                          
292D- 10 AC                BPL   L28DB                          
292F- 30 9C                BMI   L28CD                          
2931- F6 C0                INC   $C0,X                          
2933- D0 02                BNE   L2937                          
2935- F6 A0                INC   $A0,X                          
2937- B5 C1     L2937      LDA   $C1,X                          
2939- D5 C0                CMP   $C0,X                          
293B- B5 A1                LDA   $A1,X                          
293D- F5 A0                SBC   $A0,X                          
293F- 70 04                BVS   L2945                          
2941- 10 98                BPL   L28DB                          
2943- 30 88                BMI   L28CD                          
2945- 30 94     L2945      BMI   L28DB                          
2947- 10 84                BPL   L28CD                          
2949- B5 C1                LDA   $C1,X                          
294B- 38                   SEC                                  
294C- F5 C0                SBC   $C0,X                          
294E- 95 C1                STA   $C1,X                          
2950- B5 A1                LDA   $A1,X                          
2952- F5 A0                SBC   $A0,X                          
2954- 95 A1                STA   $A1,X                          
2956- E8                   INX                                  
2957- D0 CA                BNE   L2923                          
2959- B5 C0                LDA   $C0,X                          
295B- 18                   CLC                                  
295C- 75 C1                ADC   $C1,X                          
295E- 95 C1                STA   $C1,X                          
2960- B5 A0                LDA   $A0,X                          
2962- 75 A1                ADC   $A1,X                          
2964- 95 A1                STA   $A1,X                          
2966- E8                   INX                                  
2967- D0 CE                BNE   L2937                          
2969- C8                   INY                                  
296A- B1 F2                LDA   ($F2),Y                        
296C- 85 E7                STA   $E7                            
296E- C8                   INY                                  
296F- B1 F2                LDA   ($F2),Y                        
2971- 85 E8                STA   $E8                            
2973- 98                   TYA                                  
2974- 38                   SEC                                  
2975- 65 F2                ADC   $F2                            
2977- 48                   PHA                                  
2978- A5 F3                LDA   $F3                            
297A- 69 00                ADC   #$00                           
297C- 48                   PHA                                  
297D- 20 E6 00             JSR   HPAG                           
2980- 68                   PLA                                  
2981- 85 F3                STA   $F3                            
2983- 68                   PLA                                  
2984- 85 F2                STA   $F2                            
2986- A0 00                LDY   #$00                           
2988- 4C F1 00             JMP   $00F1                          
298B- B5 C0                LDA   $C0,X                          
298D- 85 E7                STA   $E7                            
298F- B5 A0                LDA   $A0,X                          
2991- 85 E8                STA   $E8                            
2993- E8                   INX                                  
2994- 98                   TYA                                  
2995- 38                   SEC                                  
2996- 65 F2                ADC   $F2                            
2998- 48                   PHA                                  
2999- A5 F3                LDA   $F3                            
299B- 69 00                ADC   #$00                           
299D- 48                   PHA                                  
299E- 20 E6 00             JSR   HPAG                           
29A1- 68                   PLA                                  
29A2- 85 F3                STA   $F3                            
29A4- 68                   PLA                                  
29A5- 85 F2                STA   $F2                            
29A7- A0 00                LDY   #$00                           
29A9- 4C F1 00             JMP   $00F1                          
29AC- A5 E0                LDA   XO                             
29AE- C8                   INY                                  
29AF- 38                   SEC                                  
29B0- F1 F2                SBC   ($F2),Y                        
29B2- 85 E0                STA   XO                             
29B4- B0 02                BCS   L29B8                          
29B6- C6 E1                DEC   $E1                            
29B8- C8        L29B8      INY                                  
29B9- B1 F2                LDA   ($F2),Y                        
29BB- F0 0F                BEQ   L29CC                          
29BD- 0A                   ASL                                  
29BE- A8                   TAY                                  
29BF- B5 A0     L29BF      LDA   $A0,X                          
29C1- 88                   DEY                                  
29C2- 91 E0                STA   (XO),Y                         
29C4- B5 C0                LDA   $C0,X                          
29C6- E8        L29C6      INX                                  
29C7- 88                   DEY                                  
29C8- 91 E0                STA   (XO),Y                         
29CA- D0 F3                BNE   L29BF                          
29CC- A0 03     L29CC      LDY   #$03                           
29CE- 4C F1 00             JMP   $00F1                          
29D1- A5 E0                LDA   XO                             
29D3- C8                   INY                                  
29D4- 18                   CLC                                  
29D5- 71 F2                ADC   ($F2),Y                        
29D7- 85 E0                STA   XO                             
29D9- B0 01                BCS   L29DC                          
29DB- 60                   RTS                                  
29DC- E6 E1     L29DC      INC   $E1                            
29DE- 60                   RTS                                  
29DF- 98                   TYA                                  
29E0- 38                   SEC                                  
29E1- 65 F2                ADC   $F2                            
29E3- 85 F2                STA   $F2                            
29E5- B0 03                BCS   L29EA                          
29E7- 6C F2 00             JMP   ($00F2)                        
29EA- E6 F3     L29EA      INC   $F3                            
29EC- 6C F2 00             JMP   ($00F2)                        
29EF- E8                   INX                                  
29F0- B5 9F                LDA   $9F,X                          
29F2- 15 BF                ORA   $BF,X                          
29F4- F0 0A                BEQ   L2A00                          
29F6- C8                   INY                                  
29F7- C8                   INY                                  
29F8- 30 03                BMI   L29FD                          
29FA- 4C F0 00             JMP   $00F0                          
29FD- 4C 00 D8  L29FD      JMP   $D800                          
2A00- C8        L2A00      INY                                  
2A01- B1 F2                LDA   ($F2),Y                        
2A03- 48                   PHA                                  
2A04- C8                   INY                                  
2A05- B1 F2                LDA   ($F2),Y                        
2A07- 85 F3                STA   $F3                            
2A09- 68                   PLA                                  
2A0A- 85 F2                STA   $F2                            
2A0C- A0 00                LDY   #$00                           
2A0E- 4C F1 00             JMP   $00F1                          
2A11- 18        L2A11      CLC                                  
2A12- FB                   ???                                  
2A13- 90 18                BCC   L2A2D                          
2A15- FB                   ???                                  
2A16- A9 57                LDA   #$57                           
2A18- 8D 3F 10             STA   $103F                          
2A1B- A9 10                LDA   #$10                           
2A1D- 8D 40 10             STA   $1040                          
2A20- 20 1C 10             JSR   $101C                          
2A23- A9 4E                LDA   #$4E                           
2A25- 8D 3F 10             STA   $103F                          
2A28- A9 10                LDA   #$10                           
2A2A- 8D 40 10             STA   $1040                          
2A2D- 20 00 BF  L2A2D      JSR   MLI                            
2A30- C8                   INY                                  
2A31- 3E 10 D0             ROL   $D010,X                        
2A34- 19 AD 43             ORA   $43AD,Y                        
2A37- 10 8D                BPL   L29C6                          
2A39- 45 10                EOR   $10                            
2A3B- 20 00 BF             JSR   MLI                            
2A3E- CA                   DEX                                  
2A3F- 44 10                ???   $10                            
2A41- D0 0B                BNE   L2A4E                          
2A43- 20 00 BF             JSR   MLI                            
2A46- CC 4C 10             CPY   $104C                          
2A49- D0 03                BNE   L2A4E                          
2A4B- 4C 00 20             JMP   L2000                          
2A4E- 60        L2A4E      RTS                                  
2A4F- 03                   ???                                  
2A50- 4E 10 00             LSR   $0010                          
2A53- 08                   PHP                                  
2A54- 00                   BRK                                  
2A55- 04 00                TSB   $00                            
2A57- 00                   BRK                                  
2A58- 20 00 9F             JSR   $9F00                          
2A5B- 00                   BRK                                  
2A5C- 00                   BRK                                  
2A5D- 01 00                ORA   ($00,X)                        
2A5F- 08                   PHP                                  
2A60- 50 4C                BVC   $2AAE                          
2A62- 56 4D                LSR   $4D,X                          
2A64- 2E 31 32             ROL   $3231                          
2A67- 38                   SEC                                  
2A68- 06 50                ASL   $50                            
2A6A- 4C 56 4D             JMP   $4D56                          
2A6D- 31 36                AND   (CSWL),Y                       
