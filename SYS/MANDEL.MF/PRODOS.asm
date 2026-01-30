2000- 4C 06 20  L2000      JMP   L2006                          
2003- EE F2 21             INC   L21F2                          
2006- A5 43     L2006      LDA   A4H                            
2008- 8D 7D 22             STA   L227D                          
200B- 20 EB 25             JSR   L25EB                          
200E- AE 89 22             LDX   L2289                          
2011- AC 8A 22             LDY   L228A                          
2014- 20 26 29             JSR   L2926                          
2017- B0 23                BCS   L203C                          
2019- A0 00                LDY   #$00                           
201B- A9 FF                LDA   #$FF                           
201D- 8D FF BF             STA   $BFFF                          
2020- 4D FF BF             EOR   $BFFF                          
2023- 38        L2023      SEC                                  
2024- D0 28                BNE   L204E                          
2026- 8D FF BF             STA   $BFFF                          
2029- AD FF BF             LDA   $BFFF                          
202C- D0 20                BNE   L204E                          
202E- AD 82 C0             LDA   PHASE1OFF                      
2031- 20 59 25             JSR   L2559                          
2034- B0 06                BCS   L203C                          
2036- A5 0C                LDA   $0C                            
2038- 29 20                AND   #$20                           
203A- D0 03                BNE   L203F                          
203C- 4C 48 22  L203C      JMP   L2248                          
203F- AE 8B 22  L203F      LDX   L228B                          
2042- AC 8C 22             LDY   L228C                          
2045- 20 26 29             JSR   L2926                          
2048- AD FF BF             LDA   $BFFF                          
204B- 8D F4 FD             STA   $FDF4                          
204E- B0 6A     L204E      BCS   L20BA                          
2050- AD 82 C0             LDA   PHASE1OFF                      
2053- AE B3 FB             LDX   $FBB3                          
2056- E0 06                CPX   #$06                           
2058- D0 42                BNE   L209C                          
205A- A9 E0                LDA   #$E0                           
205C- 2C C0 FB             BIT   $FBC0                          
205F- 08                   PHP                                  
2060- A5 0C                LDA   $0C                            
2062- 29 37                AND   #$37                           
2064- 28                   PLP                                  
2065- 50 02                BVC   L2069                          
2067- 30 0F                BMI   L2078                          
2069- 08        L2069      PHP                                  
206A- 09 08                ORA   #$08                           
206C- 28                   PLP                                  
206D- 10 04                BPL   L2073                          
206F- 09 40                ORA   #$40                           
2071- 10 07                BPL   L207A                          
2073- EE 58 09  L2073      INC   $0958                          
2076- 70 02                BVS   L207A                          
2078- 09 80     L2078      ORA   #$80                           
207A- 85 0C     L207A      STA   $0C                            
207C- AD 82 C0             LDA   PHASE1OFF                      
207F- 38                   SEC                                  
2080- 20 1F FE             JSR   $FE1F                          
2083- B0 17                BCS   L209C                          
2085- EE 93 22             INC   L2293                          
2088- A9 00                LDA   #$00                           
208A- 8D FB 04             STA   $04FB                          
208D- 20 93 FE             JSR   $FE93                          
2090- AD F2 21             LDA   L21F2                          
2093- D0 07                BNE   L209C                          
2095- 8F BD                ???   L2054                          
2097- 00                   BRK                                  
2098- E1 20                SBC   (WNDLFT,X)                     
209A- 1F 2B                ???   L20C7                          
209C- AD 7D 22  L209C      LDA   L227D                          
209F- 8D 84 22             STA   L2284                          
20A2- 8D 30 BF             STA   $BF30                          
20A5- 20 B8 26             JSR   L26B8                          
20A8- AD 84 22             LDA   L2284                          
20AB- 8D 30 BF             STA   $BF30                          
20AE- 20 52 25             JSR   L2552                          
20B1- AE 8D 22             LDX   L228D                          
20B4- AC 8E 22             LDY   L228E                          
20B7- 20 26 29             JSR   L2926                          
20BA- B0 3F     L20BA      BCS   L20FB                          
20BC- AD 98 BF             LDA   $BF98                          
20BF- 29 20                AND   #$20                           
20C1- F0 3B                BEQ   L20FE                          
20C3- A9 EC                LDA   #$EC                           
20C5- 8D 04 BF             STA   $BF04                          
20C8- A9 FC                LDA   #$FC                           
20CA- 8D 05 BF             STA   $BF05                          
20CD- AD 83 C0             LDA   PHASE1ON                       
20D0- AD 83 C0             LDA   PHASE1ON                       
20D3- A2 BB                LDX   #$BB                           
20D5- A0 22                LDY   #$22                           
20D7- AD 98 BF             LDA   $BF98                          
20DA- 2C 94 22             BIT   L2294                          
20DD- D0 0F                BNE   L20EE                          
20DF- 29 C2                AND   #$C2                           
20E1- C9 82                CMP   #$82                           
20E3- F0 09                BEQ   L20EE                          
20E5- AE 8F 22             LDX   L228F                          
20E8- AC 90 22             LDY   L2290                          
20EB- EE 95 22             INC   L2295                          
20EE- 20 26 29  L20EE      JSR   L2926                          
20F1- A9 EE                LDA   #$EE                           
20F3- 8D 00 D0             STA   $D000                          
20F6- 20 52 25             JSR   L2552                          
20F9- 90 03                BCC   L20FE                          
20FB- 4C 48 22  L20FB      JMP   L2248                          
20FE- AD 98 BF  L20FE      LDA   $BF98                          
2101- 29 30                AND   #$30                           
2103- 49 30                EOR   #$30                           
2105- D0 16                BNE   L211D                          
2107- A2 FF                LDX   #$FF                           
2109- 08                   PHP                                  
210A- 68                   PLA                                  
210B- 78                   SEI                                  
210C- 8D 09 C0             STA   SETALTZP                       
210F- 8E 01 01             STX   $0101                          
2112- 8D 08 C0             STA   CLRALTZP                       
2115- 48                   PHA                                  
2116- 28                   PLP                                  
2117- 8D 0A C0             STA   CLRSLOTC3ROM                   
211A- 20 00 2C             JSR   L2C00                          
211D- AD 81 C0  L211D      LDA   PHASEON                        
2120- AC FE FF             LDY   $FFFE                          
2123- AE FF FF             LDX   $FFFF                          
2126- 20 52 25             JSR   L2552                          
2129- E0 D0                CPX   #$D0                           
212B- A9 00                LDA   #$00                           
212D- B0 19                BCS   L2148                          
212F- 8D 09 C0             STA   SETALTZP                       
2132- A9 FF                LDA   #$FF                           
2134- 8D 01 01             STA   $0101                          
2137- 8E FF FF             STX   $FFFF                          
213A- 8C FE FF             STY   $FFFE                          
213D- 8D 08 C0             STA   CLRALTZP                       
2140- 8E FF FF             STX   $FFFF                          
2143- 8C FE FF             STY   $FFFE                          
2146- A9 01                LDA   #$01                           
2148- 8D F5 DF  L2148      STA   $DFF5                          
214B- A9 00                LDA   #$00                           
214D- 8D FF FE             STA   $FEFF                          
2150- AD 93 22             LDA   L2293                          
2153- F0 06                BEQ   L215B                          
2155- EE FF FE             INC   $FEFF                          
2158- 4C C6 21             JMP   L21C6                          
215B- 8D 0A C0  L215B      STA   CLRSLOTC3ROM                   
215E- AD 99 BF             LDA   $BF99                          
2161- 29 08                AND   #$08                           
2163- D0 03                BNE   L2168                          
2165- 4C CE 21             JMP   L21CE                          
2168- 8D 0B C0  L2168      STA   SETSLOTC3ROM                   
216B- AD 05 C3             LDA   $C305                          
216E- C9 38                CMP   #$38                           
2170- D0 27                BNE   L2199                          
2172- AD 07 C3             LDA   $C307                          
2175- C9 18                CMP   #$18                           
2177- D0 20                BNE   L2199                          
2179- AD 0B C3             LDA   $C30B                          
217C- C9 01                CMP   #$01                           
217E- D0 19                BNE   L2199                          
2180- AD 0C C3             LDA   $C30C                          
2183- 29 F0                AND   #$F0                           
2185- C9 80                CMP   #$80                           
2187- D0 10                BNE   L2199                          
2189- AD 98 BF             LDA   $BF98                          
218C- 29 C8                AND   #$C8                           
218E- C9 C0                CMP   #$C0                           
2190- F0 34                BEQ   L21C6                          
2192- AD FA C3             LDA   $C3FA                          
2195- C9 2C                CMP   #$2C                           
2197- F0 2D                BEQ   L21C6                          
2199- 8D 0A C0  L2199      STA   CLRSLOTC3ROM                   
219C- 8D 01 C0             STA   SET80STORE                     
219F- 8D 55 C0             STA   PAGE2SET                       
21A2- A9 EE                LDA   #$EE                           
21A4- 8D 00 04             STA   $0400                          
21A7- 0A                   ASL                                  
21A8- 0E 00 04             ASL   $0400                          
21AB- CD 00 04             CMP   $0400                          
21AE- D0 07                BNE   L21B7                          
21B0- 4A                   LSR                                  
21B1- 4E 00 04             LSR   $0400                          
21B4- CD 00 04             CMP   $0400                          
21B7- 8D 54 C0  L21B7      STA   PAGE2CLR                       
21BA- 8D 00 C0             STA   KBD                            
21BD- F0 07                BEQ   L21C6                          
21BF- AD 98 BF             LDA   $BF98                          
21C2- 29 FD                AND   #$FD                           
21C4- D0 05                BNE   L21CB                          
21C6- AD 98 BF  L21C6      LDA   $BF98                          
21C9- 09 02                ORA   #$02                           
21CB- 8D 98 BF  L21CB      STA   $BF98                          
21CE- AD 93 22  L21CE      LDA   L2293                          
21D1- F0 16                BEQ   L21E9                          
21D3- A9 4C                LDA   #$4C                           
21D5- 8D 06 BF             STA   $BF06                          
21D8- AE 91 22             LDX   L2291                          
21DB- AC 92 22             LDY   L2292                          
21DE- 20 26 29             JSR   L2926                          
21E1- AD 98 BF             LDA   $BF98                          
21E4- 09 01                ORA   #$01                           
21E6- 8D 98 BF             STA   $BF98                          
21E9- AD F2 21  L21E9      LDA   L21F2                          
21EC- F0 05                BEQ   L21F3                          
21EE- AD 82 C0             LDA   PHASE1OFF                      
21F1- 60        L21F1      RTS                                  
21F2- 00        L21F2      BRK                                  
21F3- 20 00 BF  L21F3      JSR   MLI                            
21F6- C5 7C                CMP   $7C                            
21F8- 22 D0                ???   $D0                            
21FA- 4D AD 81             EOR   $81AD                          
21FD- 02 29                ???   BASH                           
21FF- 0F F0                ???   L21F1                          
2201- 46 18                LSR   $18                            
2203- 69 01                ADC   #$01                           
2205- 8D 80 02             STA   $0280                          
2208- A9 2F                LDA   #$2F                           
220A- 8D 81 02             STA   $0281                          
220D- 20 00 BF             JSR   MLI                            
2210- C6 80                DEC   $80                            
2212- 22 D0                ???   $D0                            
2214- 33                   ???                                  
2215- AA                   TAX                                  
2216- 86 14                STX   $14                            
2218- A0 02                LDY   #$02                           
221A- A9 0C                LDA   #$0C                           
221C- 85 15     L221C      STA   $15                            
221E- 8D 86 22             STA   L2286                          
2221- 8C 87 22             STY   L2287                          
2224- 8E 88 22             STX   L2288                          
2227- 20 00 BF             JSR   MLI                            
222A- 80 83                BRA   L21AF                          
222C- 22 D0                ???   $D0                            
222E- 19 A0 03             ORA   $03A0,Y                        
2231- B1 14                LDA   ($14),Y                        
2233- AA                   TAX                                  
2234- 88                   DEY                                  
2235- 11 14                ORA   ($14),Y                        
2237- F0 0C                BEQ   L2245                          
2239- B1 14                LDA   ($14),Y                        
223B- A8                   TAY                                  
223C- A5 15                LDA   $15                            
223E- 18                   CLC                                  
223F- 69 02                ADC   #$02                           
2241- C9 14                CMP   #$14                           
2243- 90 D7                BCC   L221C                          
2245- 4C 00 08  L2245      JMP   $0800                          
2248- 8D 82 C0  L2248      STA   PHASE1OFF                      
224B- 20 58 FC             JSR   HOME                           
224E- A0 1E     L224E      LDY   #$1E                           
2250- B9 5C 22  L2250      LDA   L225C,Y                        
2253- 99 A9 05             STA   $05A9,Y                        
2256- 88                   DEY                                  
2257- 10 F7                BPL   L2250                          
2259- 4C 59 22  L2259      JMP   L2259                          
225C- D2 C5     L225C      CMP   ($C5)                          
225E- CC CF C3             CPY   $C3CF                          
2261- C1 D4                CMP   ($D4,X)                        
2263- C9 CF                CMP   #$CF                           
2265- CE AF A0             DEC   $A0AF                          
2268- A0 C3                LDY   #$C3                           
226A- CF CE                ???   L223A                          
226C- C6 C9                DEC   $C9                            
226E- C7 D5                ???   $D5                            
2270- D2 C1                CMP   ($C1)                          
2272- D4 C9                ???   $C9                            
2274- CF CE                ???   L2244                          
2276- A0 C5                LDY   #$C5                           
2278- D2 D2                CMP   ($D2)                          
227A- CF D2                ???   L224E                          
227C- 02 60                ???   $60                            
227E- 81 02                STA   ($02,X)                        
2280- 01 80                ORA   ($80,X)                        
2282- 02 03                ???   $03                            
2284- 00        L2284      BRK                                  
2285- 00                   BRK                                  
2286- 00        L2286      BRK                                  
2287- 00        L2287      BRK                                  
2288- 00        L2288      BRK                                  
2289- 96 22     L2289      STX   WNDTOP,Y                       
228B- C3        L228B      ???                                  
228C- 22 E5     L228C      ???   $E5                            
228E- 22 B3     L228E      ???   $B3                            
2290- 22 F8     L2290      ???   $F8                            
2292- 22 00     L2292      ???   $00                            
2294- 00        L2294      BRK                                  
2295- 00        L2295      BRK                                  
2296- 01 00                ORA   ($00,X)                        
2298- 08                   PHP                                  
2299- 28                   PLP                                  
229A- 02 00                ???   $00                            
229C- 23                   ???                                  
229D- 01 D6                ORA   ($D6,X)                        
229F- 03                   ???                                  
22A0- 2A                   ROL                                  
22A1- 00                   BRK                                  
22A2- 28                   PLP                                  
22A3- 25 01                AND   $01                            
22A5- 0A                   ASL                                  
22A6- 00                   BRK                                  
22A7- 02 00                ???   $00                            
22A9- 14 00                TRB   $00                            
22AB- 01 80                ORA   ($80,X)                        
22AD- 00                   BRK                                  
22AE- 46 00                LSR   $00                            
22B0- A5 25                LDA   CV                             
22B2- FF 01                ???   L22B5                          
22B4- 00                   BRK                                  
22B5- D1 00     L22B5      CMP   ($00),Y                        
22B7- 03                   ???                                  
22B8- 00                   BRK                                  
22B9- 5A                   PHY                                  
22BA- FF 01                ???   L22BD                          
22BC- 00                   BRK                                  
22BD- D1 00     L22BD      CMP   ($00),Y                        
22BF- 03                   ???                                  
22C0- 00                   BRK                                  
22C1- 5D FF 01             EOR   $01FF,X                        
22C4- 9B                   ???                                  
22C5- FF 65                ???   L232C                          
22C7- 00                   BRK                                  
22C8- 9B        L22C8      ???                                  
22C9- 52 01                EOR   ($01)                          
22CB- 00                   BRK                                  
22CC- BF 00                ???   L22CE                          
22CE- 01 00     L22CE      ORA   ($00,X)                        
22D0- 51 00                EOR   ($00),Y                        
22D2- 00                   BRK                                  
22D3- D7 00                ???   $00                            
22D5- 07 01                ???   $01                            
22D7- 00                   BRK                                  
22D8- DE 00 21             DEC   L2100,X                        
22DB- 00                   BRK                                  
22DC- 30 01                BMI   L22DF                          
22DE- 00                   BRK                                  
22DF- D0 00     L22DF      BNE   L22E1                          
22E1- 07 00     L22E1      ???   $00                            
22E3- 53                   ???                                  
22E4- FF 01                ???   L22E7                          
22E6- 42 D7                ???   $D7                            
22E8- 7D 00 00             ADC   $0000,X                        
22EB- 52 04                EOR   ($04)                          
22ED- 42 D7                ???   $D7                            
22EF- 69 00                ADC   #$00                           
22F1- 42 D7                ???   $D7                            
22F3- 00                   BRK                                  
22F4- C1 C1                CMP   ($C1,X)                        
22F6- 00        L22F6      BRK                                  
22F7- FF 01                ???   L22FA                          
22F9- 42 D7                ???   $D7                            
22FB- 7D 00 00             ADC   $0000,X                        
22FE- 60                   RTS                                  
22FF- FF 20                ???   L2321                          
2301- 00                   BRK                                  
2302- BF C4                ???   L22C8                          
2304- 7D 08 90             ADC   $9008,X                        
2307- 07 C9                ???   $C9                            
2309- 46 F0                LSR   $F0                            
230B- 45 4C                EOR   $4C                            
230D- 54 23                ???   WNDBTM                         
230F- AD 81 08             LDA   $0881                          
2312- C9 E2                CMP   #$E2                           
2314- D0 3E                BNE   L2354                          
2316- 20 00 BF             JSR   MLI                            
2319- C8                   INY                                  
231A- 8F 08                ???   L2324                          
231C- D0 36                BNE   L2354                          
231E- 20 00 BF             JSR   MLI                            
2321- D1 0B     L2321      CMP   ($0B),Y                        
2323- 0A                   ASL                                  
2324- D0 2E     L2324      BNE   L2354                          
2326- AD 0F 0A             LDA   $0A0F                          
2329- D0 29                BNE   L2354                          
232B- AD 0E 0A             LDA   $0A0E                          
232E- C9 9F                CMP   #$9F                           
2330- B0 22                BCS   L2354                          
2332- 8D 15 0A             STA   $0A15                          
2335- AD 0D 0A             LDA   $0A0D                          
2338- 8D 14 0A             STA   $0A14                          
233B- 20 00 BF             JSR   MLI                            
233E- CA                   DEX                                  
233F- 10 0A                BPL   L234B                          
2341- D0 11                BNE   L2354                          
2343- 20 00 BF             JSR   MLI                            
2346- CC 18 0A             CPY   $0A18                          
2349- D0 09                BNE   L2354                          
234B- AD 82 C0  L234B      LDA   PHASE1OFF                      
234E- 20 00 20             JSR   L2000                          
2351- 4C 9C 08             JMP   $089C                          
2354- AE 62 23  L2354      LDX   L2362                          
2357- BD 62 23  L2357      LDA   L2362,X                        
235A- 9D A8 07             STA   $07A8,X                        
235D- CA                   DEX                                  
235E- D0 F7                BNE   L2357                          
2360- F0 FE     L2360      BEQ   L2360                          
2362- 1A        L2362      INC                                  
2363- D5 CE                CMP   $CE,X                          
2365- C1 C2                CMP   ($C2,X)                        
2367- CC C5 A0             CPY   $A0C5                          
236A- D4 CF                ???   $CF                            
236C- A0 CC                LDY   #$CC                           
236E- CF C1                ???   L2331                          
2370- C4 A0                CPY   $A0                            
2372- C1 D4                CMP   ($D4,X)                        
2374- C9 CE                CMP   #$CE                           
2376- C9 D4                CMP   #$D4                           
2378- A0 C6                LDY   #$C6                           
237A- C9 CC                CMP   #$CC                           
237C- C5 0A                CMP   $0A                            
237E- 95 08                STA   $08,X                          
2380- 00                   BRK                                  
2381- 00                   BRK                                  
2382- 00                   BRK                                  
2383- 00                   BRK                                  
2384- 00                   BRK                                  
2385- 00                   BRK                                  
2386- 00                   BRK                                  
2387- 00                   BRK                                  
2388- 00                   BRK                                  
2389- 00                   BRK                                  
238A- 00                   BRK                                  
238B- 00                   BRK                                  
238C- 00                   BRK                                  
238D- 00                   BRK                                  
238E- 00                   BRK                                  
238F- 03                   ???                                  
2390- 95 08                STA   $08,X                          
2392- 00                   BRK                                  
2393- 14 01                TRB   $01                            
2395- 06 E1                ASL   $E1                            
2397- F4 E9                ???   $E9                            
2399- EE E9 F4             INC   $F4E9                          
239C- A9 0C                LDA   #$0C                           
239E- 85 11                STA   $11                            
23A0- A9 04                LDA   #$04                           
23A2- D0 02                BNE   L23A6                          
23A4- A5 10     L23A4      LDA   $10                            
23A6- 18        L23A6      CLC                                  
23A7- 6D 23 0C             ADC   $0C23                          
23AA- 85 10                STA   $10                            
23AC- B0 12                BCS   L23C0                          
23AE- 6D 23 0C             ADC   $0C23                          
23B1- 90 0F                BCC   L23C2                          
23B3- A5 11                LDA   $11                            
23B5- 4A                   LSR                                  
23B6- 90 0A                BCC   L23C2                          
23B8- C9 09                CMP   #$09                           
23BA- F0 1E                BEQ   L23DA                          
23BC- A9 04                LDA   #$04                           
23BE- 85 10                STA   $10                            
23C0- E6 11     L23C0      INC   $11                            
23C2- A0 10     L23C2      LDY   #$10                           
23C4- A9 FF                LDA   #$FF                           
23C6- 51 10                EOR   ($10),Y                        
23C8- D0 DA                BNE   L23A4                          
23CA- A8                   TAY                                  
23CB- B1 10                LDA   ($10),Y                        
23CD- F0 D5                BEQ   L23A4                          
23CF- 29 0F                AND   #$0F                           
23D1- 8D 80 02             STA   $0280                          
23D4- C9 08                CMP   #$08                           
23D6- 90 CC                BCC   L23A4                          
23D8- B0 02                BCS   L23DC                          
23DA- F0 7D     L23DA      BEQ   L2459                          
23DC- A8        L23DC      TAY                                  
23DD- A2 06                LDX   #$06                           
23DF- B1 10     L23DF      LDA   ($10),Y                        
23E1- 5D 21 0A             EOR   $0A21,X                        
23E4- 0A                   ASL                                  
23E5- D0 BD                BNE   L23A4                          
23E7- 88                   DEY                                  
23E8- CA                   DEX                                  
23E9- 10 F4                BPL   L23DF                          
23EB- A0 00                LDY   #$00                           
23ED- C8        L23ED      INY                                  
23EE- B1 10                LDA   ($10),Y                        
23F0- 99 80 02             STA   $0280,Y                        
23F3- 09 80                ORA   #$80                           
23F5- 99 F1 09             STA   $09F1,Y                        
23F8- CC 80 02             CPY   $0280                          
23FB- D0 F0                BNE   L23ED                          
23FD- A9 A0                LDA   #$A0                           
23FF- 99 F2 09             STA   $09F2,Y                        
2402- 98                   TYA                                  
2403- 69 13                ADC   #$13                           
2405- 8D 04 0A             STA   $0A04                          
2408- 20 00 BF             JSR   MLI                            
240B- C8                   INY                                  
240C- 05 0A                ORA   $0A                            
240E- D0 61                BNE   L2471                          
2410- 20 00 BF             JSR   MLI                            
2413- D1 0B                CMP   ($0B),Y                        
2415- 0A                   ASL                                  
2416- D0 59                BNE   L2471                          
2418- AD 0F 0A             LDA   $0A0F                          
241B- D0 6E                BNE   L248B                          
241D- AD 0E 0A             LDA   $0A0E                          
2420- C9 9F                CMP   #$9F                           
2422- B0 67                BCS   L248B                          
2424- 8D 15 0A             STA   $0A15                          
2427- AD 0D 0A             LDA   $0A0D                          
242A- 8D 14 0A             STA   $0A14                          
242D- 20 00 BF             JSR   MLI                            
2430- CA                   DEX                                  
2431- 10 0A                BPL   L243D                          
2433- F0 06                BEQ   L243B                          
2435- C9 56                CMP   #$56                           
2437- F0 52                BEQ   L248B                          
2439- D0 36                BNE   L2471                          
243B- 20 00 BF  L243B      JSR   MLI                            
243E- CC 18 0A             CPY   $0A18                          
2441- D0 2E                BNE   L2471                          
2443- AD 58 09             LDA   $0958                          
2446- F0 0A                BEQ   L2452                          
2448- AD 00 C0             LDA   KBD                            
244B- C9 9B                CMP   #$9B                           
244D- D0 03                BNE   L2452                          
244F- 8D 10 C0             STA   KBDSTRB                        
2452- AD 82 C0  L2452      LDA   PHASE1OFF                      
2455- 4C 00 20             JMP   L2000                          
2458- 00                   BRK                                  
2459- AD 95 22  L2459      LDA   L2295                          
245C- D0 06                BNE   L2464                          
245E- 20 00 BF             JSR   MLI                            
2461- 65 1A                ADC   $1A                            
2463- 0A                   ASL                                  
2464- A2 27     L2464      LDX   #$27                           
2466- BD 98 09  L2466      LDA   $0998,X                        
2469- 9D A8 07             STA   $07A8,X                        
246C- CA                   DEX                                  
246D- 10 F7                BPL   L2466                          
246F- 30 25                BMI   L2496                          
2471- AC 04 0A  L2471      LDY   $0A04                          
2474- A9 27                LDA   #$27                           
2476- 38                   SEC                                  
2477- ED 04 0A             SBC   $0A04                          
247A- 4A                   LSR                                  
247B- 6D 04 0A             ADC   $0A04                          
247E- AA                   TAX                                  
247F- B9 E0 09  L247F      LDA   $09E0,Y                        
2482- 9D A8 07             STA   $07A8,X                        
2485- CA                   DEX                                  
2486- 88                   DEY                                  
2487- 10 F6                BPL   L247F                          
2489- 30 0B                BMI   L2496                          
248B- A0 1E     L248B      LDY   #$1E                           
248D- B9 C0 09  L248D      LDA   $09C0,Y                        
2490- 99 AD 07             STA   $07AD,Y                        
2493- 88                   DEY                                  
2494- 10 F7                BPL   L248D                          
2496- 30 FE     L2496      BMI   L2496                          
2498- AA                   TAX                                  
2499- AA                   TAX                                  
249A- A0 A0                LDY   #$A0                           
249C- D5 CE                CMP   $CE,X                          
249E- C1 C2                CMP   ($C2,X)                        
24A0- CC C5 A0             CPY   $A0C5                          
24A3- D4 CF                ???   $CF                            
24A5- A0 C6     L24A5      LDY   #$C6                           
24A7- C9 CE                CMP   #$CE                           
24A9- C4 A0                CPY   $A0                            
24AB- C1 A0                CMP   ($A0,X)                        
24AD- A2 AE                LDX   #$AE                           
24AF- D3                   ???                                  
24B0- D9 D3 D4             CMP   $D4D3,Y                        
24B3- C5 CD                CMP   $CD                            
24B5- A2 A0                LDX   #$A0                           
24B7- C6 C9                DEC   $C9                            
24B9- CC C5 A0             CPY   $A0C5                          
24BC- A0 AA                LDY   #$AA                           
24BE- AA                   TAX                                  
24BF- A0 AA                LDY   #$AA                           
24C1- AA                   TAX                                  
24C2- A0 A0                LDY   #$A0                           
24C4- D3                   ???                                  
24C5- D9 D3 D4             CMP   $D4D3,Y                        
24C8- C5 CD                CMP   $CD                            
24CA- A0 D0                LDY   #$D0                           
24CC- D2 CF                CMP   ($CF)                          
24CE- C7 D2                ???   $D2                            
24D0- C1 CD                CMP   ($CD,X)                        
24D2- A0 D4                LDY   #$D4                           
24D4- CF CF                ???   L24A5                          
24D6- A0 CC                LDY   #$CC                           
24D8- C1 D2                CMP   ($D2,X)                        
24DA- C7 C5                ???   $C5                            
24DC- A0 A0                LDY   #$A0                           
24DE- AA                   TAX                                  
24DF- AA                   TAX                                  
24E0- AA                   TAX                                  
24E1- AA                   TAX                                  
24E2- A0 D5                LDY   #$D5                           
24E4- CE C1 C2             DEC   $C2C1                          
24E7- CC C5 A0             CPY   $A0C5                          
24EA- D4 CF                ???   $CF                            
24EC- A0 CC                LDY   #$CC                           
24EE- CF C1                ???   L24B1                          
24F0- C4 A0                CPY   $A0                            
24F2- D8                   CLD                                  
24F3- AE D3 D9             LDX   $D9D3                          
24F6- D3                   ???                                  
24F7- D4 C5                ???   $C5                            
24F9- CD A0 AA             CMP   $AAA0                          
24FC- AA                   TAX                                  
24FD- AA                   TAX                                  
24FE- AA                   TAX                                  
24FF- AA                   TAX                                  
2500- AA        L2500      TAX                                  
2501- AA                   TAX                                  
2502- AA                   TAX                                  
2503- AA                   TAX                                  
2504- 00                   BRK                                  
2505- 03                   ???                                  
2506- 80 02                BRA   L250A                          
2508- 00                   BRK                                  
2509- 14 01                TRB   $01                            
250B- 02 01                ???   $01                            
250D- 00                   BRK                                  
250E- 00                   BRK                                  
250F- 00                   BRK                                  
2510- 04 01                TSB   $01                            
2512- 00                   BRK                                  
2513- 20 00 00             JSR   $0000                          
2516- 00                   BRK                                  
2517- 00                   BRK                                  
2518- 01 00                ORA   ($00,X)                        
251A- 04 00                TSB   $00                            
251C- 00                   BRK                                  
251D- 00                   BRK                                  
251E- 00                   BRK                                  
251F- 00                   BRK                                  
2520- 00                   BRK                                  
2521- AE D3 D9             LDX   $D9D3                          
2524- D3                   ???                                  
2525- D4 C5                ???   $C5                            
2527- CD 8D 08             CMP   $088D                          
252A- C0 B5                CPY   #$B5                           
252C- 42 8D                ???   $8D                            
252E- 09 C0                ORA   #$C0                           
2530- 95 42                STA   A4L,X                          
2532- CA                   DEX                                  
2533- 10 F3                BPL   L2528                          
2535- A9 28                LDA   #$28                           
2537- 38                   SEC                                  
2538- 8D 08 C0             STA   CLRALTZP                       
253B- 60                   RTS                                  
253C- 3C FD 00             BIT   $00FD,X                        
253F- 00                   BRK                                  
2540- 00                   BRK                                  
2541- 00                   BRK                                  
2542- 59 FA 59             EOR   L59FA,Y                        
2545- FF 5A                ???   L25A1                          
2547- 4C 59 FF             JMP   $FF59                          
254A- 4C 59 FF             JMP   $FF59                          
254D- 4C 59 FF             JMP   $FF59                          
2550- EB                   ???                                  
2551- BF AD                ???   L2500                          
2553- 8B                   ???                                  
2554- C0 AD                CPY   #$AD                           
2556- 8B                   ???                                  
2557- C0 60                CPY   #$60                           
2559- A9 00     L2559      LDA   #$00                           
255B- 85 0C                STA   $0C                            
255D- AE B3 FB             LDX   $FBB3                          
2560- E0 38                CPX   #$38                           
2562- F0 21                BEQ   L2585                          
2564- A9 80                LDA   #$80                           
2566- E0 06                CPX   #$06                           
2568- F0 1B                BEQ   L2585                          
256A- A9 40                LDA   #$40                           
256C- E0 EA                CPX   #$EA                           
256E- D0 0F                BNE   L257F                          
2570- AE 1E FB             LDX   PREAD                          
2573- E0 AD                CPX   #$AD                           
2575- F0 0E                BEQ   L2585                          
2577- A9 D0                LDA   #$D0                           
2579- E0 8A                CPX   #$8A                           
257B- D0 02                BNE   L257F                          
257D- 38        L257D      SEC                                  
257E- 60                   RTS                                  
257F- A9 02     L257F      LDA   #$02                           
2581- 91 14                STA   ($14),Y                        
2583- D0 1D                BNE   L25A2                          
2585- 85 0C     L2585      STA   $0C                            
2587- 20 52 25             JSR   L2552                          
258A- A9 AA                LDA   #$AA                           
258C- 8D 00 D0             STA   $D000                          
258F- 4D 00 D0             EOR   $D000                          
2592- D0 E9                BNE   L257D                          
2594- 4E 00 D0             LSR   $D000                          
2597- A9 55                LDA   #$55                           
2599- 4D 00 D0             EOR   $D000                          
259C- D0 DF                BNE   L257D                          
259E- A9 20                LDA   #$20                           
25A0- 05 0C                ORA   $0C                            
25A2- 4C 80 00  L25A2      JMP   $0080                          
25A5- 85 0C                STA   $0C                            
25A7- 10 35                BPL   L25DE                          
25A9- A9 EE                LDA   #$EE                           
25AB- 8D 05 C0             STA   SETRAMWRT                      
25AE- 8D 03 C0             STA   SETRAMRD                       
25B1- 8D 00 0C             STA   $0C00                          
25B4- 8D 00 08             STA   $0800                          
25B7- AD 00 0C             LDA   $0C00                          
25BA- C9 EE                CMP   #$EE                           
25BC- D0 0E                BNE   L25CC                          
25BE- 0E 00 0C             ASL   $0C00                          
25C1- 0A                   ASL                                  
25C2- CD 00 0C             CMP   $0C00                          
25C5- D0 05                BNE   L25CC                          
25C7- CD 00 08             CMP   $0800                          
25CA- D0 03                BNE   L25CF                          
25CC- 38        L25CC      SEC                                  
25CD- B0 01                BCS   L25D0                          
25CF- 18        L25CF      CLC                                  
25D0- 8D 04 C0  L25D0      STA   CLRRAMWRT                      
25D3- 8D 02 C0             STA   CLRRAMRD                       
25D6- B0 06                BCS   L25DE                          
25D8- A5 0C                LDA   $0C                            
25DA- 09 30                ORA   #$30                           
25DC- 85 0C                STA   $0C                            
25DE- A5 0B     L25DE      LDA   $0B                            
25E0- 38                   SEC                                  
25E1- E9 05                SBC   #$05                           
25E3- 85 0B                STA   $0B                            
25E5- B0 02                BCS   L25E9                          
25E7- C6 0A                DEC   $0A                            
25E9- 18        L25E9      CLC                                  
25EA- 60                   RTS                                  
25EB- AD 30 C0  L25EB      LDA   SPKR                           
25EE- 8D 0C C0             STA   CLR80VID                       
25F1- 8D 00 C0             STA   KBD                            
25F4- 20 84 FE             JSR   SETNORM                        
25F7- 20 2F FB             JSR   INIT                           
25FA- 20 93 FE             JSR   $FE93                          
25FD- 20 89 FE             JSR   $FE89                          
2600- D8                   CLD                                  
2601- 20 58 FC             JSR   HOME                           
2604- A2 07                LDX   #$07                           
2606- BD 3F 26  L2606      LDA   L263F,X                        
2609- 9D B8 04             STA   $04B8,X                        
260C- CA                   DEX                                  
260D- 10 F7                BPL   L2606                          
260F- A2 1D     L260F      LDX   #$1D                           
2611- BD 47 26  L2611      LDA   L2647,X                        
2614- 9D AD 05             STA   $05AD,X                        
2617- CA                   DEX                                  
2618- 10 F7                BPL   L2611                          
261A- A2 0B                LDX   #$0B                           
261C- BD 65 26  L261C      LDA   L2665,X                        
261F- 9D B6 06             STA   $06B6,X                        
2622- CA                   DEX                                  
2623- 10 F7                BPL   L261C                          
2625- A2 26                LDX   #$26                           
2627- BD 71 26  L2627      LDA   L2671,X                        
262A- 9D 50 07             STA   $0750,X                        
262D- CA                   DEX                                  
262E- 10 F7                BPL   L2627                          
2630- A2 13                LDX   #$13                           
2632- BD 98 26  L2632      LDA   L2698,X                        
2635- 9D DA 07             STA   $07DA,X                        
2638- CA                   DEX                                  
2639- 10 F7                BPL   L2632                          
263B- AD 30 C0             LDA   SPKR                           
263E- 60                   RTS                                  
263F- C1 D0     L263F      CMP   ($D0,X)                        
2641- D0 CC                BNE   L260F                          
2643- C5 A0                CMP   $A0                            
2645- C9 C9                CMP   #$C9                           
2647- D0 D2     L2647      BNE   L261B                          
2649- CF C4                ???   L260F                          
264B- CF D3     L264B      ???   L2620                          
264D- A0 B8                LDY   #$B8                           
264F- A0 D6                LDY   #$D6                           
2651- B1 AE     L2651      LDA   ($AE),Y                        
2653- B9 A0 A0             LDA   $A0A0,Y                        
2656- A0 A0                LDY   #$A0                           
2658- A0 A0                LDY   #$A0                           
265A- A0 A0                LDY   #$A0                           
265C- B1 B6                LDA   ($B6),Y                        
265E- AD CA D5             LDA   $D5CA                          
2661- CC AD B9             CPY   $B9AD                          
2664- B0 A0                BCS   L2606                          
2666- A0 A0                LDY   #$A0                           
2668- A0 A0                LDY   #$A0                           
266A- A0 A0                LDY   #$A0                           
266C- A0 A0                LDY   #$A0                           
266E- A0 A0                LDY   #$A0                           
2670- A0 C3                LDY   #$C3                           
2672- CF D0                ???   L2644                          
2674- D9 D2 C9             CMP   $C9D2,Y                        
2677- C7 C8                ???   $C8                            
2679- D4 A0                ???   $A0                            
267B- C1 D0                CMP   ($D0,X)                        
267D- D0 CC                BNE   L264B                          
267F- C5 A0                CMP   $A0                            
2681- C3                   ???                                  
2682- CF CD                ???   L2651                          
2684- D0 D5                BNE   L265B                          
2686- D4 C5                ???   $C5                            
2688- D2 AC                CMP   ($AC)                          
268A- A0 C9                LDY   #$C9                           
268C- CE C3 AE             DEC   $AEC3                          
268F- AC A0 B1             LDY   $B1A0                          
2692- B9 B8 B3             LDA   $B3B8,Y                        
2695- AD B9 B0             LDA   $B0B9                          
2698- C1 CC     L2698      CMP   ($CC,X)                        
269A- CC A0 D2             CPY   $D2A0                          
269D- C9 C7                CMP   #$C7                           
269F- C8                   INY                                  
26A0- D4 D3                ???   $D3                            
26A2- A0 D2                LDY   #$D2                           
26A4- C5 D3                CMP   $D3                            
26A6- C5 D2                CMP   $D2                            
26A8- D6 C5                DEC   $C5,X                          
26AA- C4 AE                CPY   $AE                            
26AC- 00        L26AC      BRK                                  
26AD- 00                   BRK                                  
26AE- 00                   BRK                                  
26AF- 00                   BRK                                  
26B0- 00                   BRK                                  
26B1- 00                   BRK                                  
26B2- 00                   BRK                                  
26B3- 00                   BRK                                  
26B4- 00        L26B4      BRK                                  
26B5- 00        L26B5      BRK                                  
26B6- 00        L26B6      BRK                                  
26B7- 00        L26B7      BRK                                  
26B8- A2 00     L26B8      LDX   #$00                           
26BA- 86 14                STX   $14                            
26BC- 86 15                STX   $15                            
26BE- 86 10                STX   $10                            
26C0- CA                   DEX                                  
26C1- 8E 31 BF             STX   $BF31                          
26C4- A9 0E                LDA   #$0E                           
26C6- 8D B6 26             STA   L26B6                          
26C9- A9 C2                LDA   #$C2                           
26CB- 85 11                STA   $11                            
26CD- 20 0E 29             JSR   L290E                          
26D0- 6E B7 26             ROR   L26B7                          
26D3- A9 C7                LDA   #$C7                           
26D5- 85 11                STA   $11                            
26D7- 20 0E 29  L26D7      JSR   L290E                          
26DA- B0 5C                BCS   L2738                          
26DC- B1 10                LDA   ($10),Y                        
26DE- F0 25                BEQ   L2705                          
26E0- C9 FF                CMP   #$FF                           
26E2- B0 54                BCS   L2738                          
26E4- 8D B4 26             STA   L26B4                          
26E7- A0 07                LDY   #$07                           
26E9- B1 10                LDA   ($10),Y                        
26EB- D0 03                BNE   L26F0                          
26ED- 4C 9D 28             JMP   L289D                          
26F0- A0 FE     L26F0      LDY   #$FE                           
26F2- B1 10                LDA   ($10),Y                        
26F4- 29 03                AND   #$03                           
26F6- C9 03                CMP   #$03                           
26F8- 38                   SEC                                  
26F9- D0 3D                BNE   L2738                          
26FB- 20 03 29             JSR   L2903                          
26FE- 18                   CLC                                  
26FF- 08                   PHP                                  
2700- 4A                   LSR                                  
2701- A5 11                LDA   $11                            
2703- D0 0D                BNE   L2712                          
2705- 85 12     L2705      STA   $12                            
2707- 38                   SEC                                  
2708- 08                   PHP                                  
2709- AD 31 28             LDA   L2831                          
270C- 8D B4 26             STA   L26B4                          
270F- AD 32 28             LDA   L2832                          
2712- 8D B5 26  L2712      STA   L26B5                          
2715- 20 6D 28             JSR   L286D                          
2718- 28                   PLP                                  
2719- 90 1C                BCC   L2737                          
271B- CA                   DEX                                  
271C- CA                   DEX                                  
271D- 8E 31 BF             STX   $BF31                          
2720- CE B6 26             DEC   L26B6                          
2723- CE B6 26             DEC   L26B6                          
2726- AC B6 26             LDY   L26B6                          
2729- E8                   INX                                  
272A- BD 33 BF             LDA   $BF33,X                        
272D- 99 32 BF             STA   $BF32,Y                        
2730- BD 32 BF             LDA   $BF32,X                        
2733- 99 33 BF             STA   $BF33,Y                        
2736- CA                   DEX                                  
2737- 18        L2737      CLC                                  
2738- 20 C1 27  L2738      JSR   L27C1                          
273B- C6 11                DEC   $11                            
273D- A5 11                LDA   $11                            
273F- 29 07                AND   #$07                           
2741- F0 03                BEQ   L2746                          
2743- 4C D7 26             JMP   L26D7                          
2746- AE 31 BF  L2746      LDX   $BF31                          
2749- A9 0E                LDA   #$0E                           
274B- 38                   SEC                                  
274C- ED B6 26             SBC   L26B6                          
274F- F0 22                BEQ   L2773                          
2751- 18                   CLC                                  
2752- 6D 31 BF             ADC   $BF31                          
2755- 8D 31 BF             STA   $BF31                          
2758- E8                   INX                                  
2759- A0 0D                LDY   #$0D                           
275B- B9 32 BF  L275B      LDA   $BF32,Y                        
275E- 48                   PHA                                  
275F- BD 32 BF             LDA   $BF32,X                        
2762- 99 32 BF             STA   $BF32,Y                        
2765- 68                   PLA                                  
2766- 9D 32 BF             STA   $BF32,X                        
2769- E8                   INX                                  
276A- 88                   DEY                                  
276B- 8C B6 26             STY   L26B6                          
276E- EC B6 26             CPX   L26B6                          
2771- 90 E8                BCC   L275B                          
2773- A0 00     L2773      LDY   #$00                           
2775- AE 31 BF             LDX   $BF31                          
2778- BD 32 BF  L2778      LDA   $BF32,X                        
277B- 48                   PHA                                  
277C- 29 7F                AND   #$7F                           
277E- 4D 30 BF             EOR   $BF30                          
2781- 0A                   ASL                                  
2782- D0 02                BNE   L2786                          
2784- 68                   PLA                                  
2785- C8                   INY                                  
2786- CA        L2786      DEX                                  
2787- 10 EF                BPL   L2778                          
2789- AE 31 BF             LDX   $BF31                          
278C- 98                   TYA                                  
278D- F0 14                BEQ   L27A3                          
278F- AD 30 BF             LDA   $BF30                          
2792- 9D 32 BF             STA   $BF32,X                        
2795- CA                   DEX                                  
2796- 30 12                BMI   L27AA                          
2798- 88                   DEY                                  
2799- 30 08                BMI   L27A3                          
279B- 49 80                EOR   #$80                           
279D- 9D 32 BF             STA   $BF32,X                        
27A0- CA                   DEX                                  
27A1- 30 07                BMI   L27AA                          
27A3- 68        L27A3      PLA                                  
27A4- 9D 32 BF             STA   $BF32,X                        
27A7- CA                   DEX                                  
27A8- 10 F9                BPL   L27A3                          
27AA- 20 43 28  L27AA      JSR   L2843                          
27AD- F0 04                BEQ   L27B3                          
27AF- 8D 98 BF             STA   $BF98                          
27B2- 60                   RTS                                  
27B3- 4C 7F 25  L27B3      JMP   L257F                          
27B6- 05 12     L27B6      ORA   $12                            
27B8- AE 31 BF             LDX   $BF31                          
27BB- E8                   INX                                  
27BC- 9D 32 BF             STA   $BF32,X                        
27BF- 0A                   ASL                                  
27C0- 60                   RTS                                  
27C1- 90 5F     L27C1      BCC   L2822                          
27C3- A0 06                LDY   #$06                           
27C5- B1 10     L27C5      LDA   ($10),Y                        
27C7- D9 33 28             CMP   L2833,Y                        
27CA- D0 1A                BNE   L27E6                          
27CC- 88                   DEY                                  
27CD- 88                   DEY                                  
27CE- 10 F5                BPL   L27C5                          
27D0- A5 11                LDA   $11                            
27D2- E9 C1                SBC   #$C1                           
27D4- 8D F6 22             STA   L22F6                          
27D7- A9 4C                LDA   #$4C                           
27D9- 8D 06 BF             STA   $BF06                          
27DC- A5 0C                LDA   $0C                            
27DE- F0 CA                BEQ   L27AA                          
27E0- 09 01                ORA   #$01                           
27E2- 85 0C                STA   $0C                            
27E4- D0 3C                BNE   L2822                          
27E6- A0 05     L27E6      LDY   #$05                           
27E8- B1 10                LDA   ($10),Y                        
27EA- C9 38                CMP   #$38                           
27EC- D0 23                BNE   L2811                          
27EE- A0 07                LDY   #$07                           
27F0- B1 10                LDA   ($10),Y                        
27F2- C9 18                CMP   #$18                           
27F4- D0 1B                BNE   L2811                          
27F6- A0 0B                LDY   #$0B                           
27F8- B1 10                LDA   ($10),Y                        
27FA- C9 01                CMP   #$01                           
27FC- D0 13                BNE   L2811                          
27FE- C8                   INY                                  
27FF- B1 10                LDA   ($10),Y                        
2801- 29 F0                AND   #$F0                           
2803- C9 80                CMP   #$80                           
2805- D0 0A                BNE   L2811                          
2807- A5 0C                LDA   $0C                            
2809- F0 9F                BEQ   L27AA                          
280B- 09 02                ORA   #$02                           
280D- 85 0C                STA   $0C                            
280F- D0 11                BNE   L2822                          
2811- A0 00     L2811      LDY   #$00                           
2813- A2 00                LDX   #$00                           
2815- B1 10                LDA   ($10),Y                        
2817- C9 FF                CMP   #$FF                           
2819- F0 15                BEQ   L2830                          
281B- D1 10     L281B      CMP   ($10),Y                        
281D- D0 11                BNE   L2830                          
281F- E8                   INX                                  
2820- D0 F9                BNE   L281B                          
2822- A5 11     L2822      LDA   $11                            
2824- 29 07                AND   #$07                           
2826- AA                   TAX                                  
2827- BD 3B 28             LDA   L283B,X                        
282A- 0D 99 BF             ORA   $BF99                          
282D- 8D 99 BF             STA   $BF99                          
2830- 60        L2830      RTS                                  
2831- 00        L2831      BRK                                  
2832- D0 08     L2832      BNE   L283C                          
2834- 20 28 00             JSR   BASL                           
2837- 58                   CLI                                  
2838- 03                   ???                                  
2839- 70 3C                BVS   L2877                          
283B- 00        L283B      BRK                                  
283C- 02 04     L283C      ???   $04                            
283E- 08        L283E      PHP                                  
283F- 10 20                BPL   L2861                          
2841- 40                   RTI                                  
2842- 80 18                BRA   L285C                          
2844- AC 3B 28             LDY   L283B                          
2847- B1 0A     L2847      LDA   ($0A),Y                        
2849- 29 DF                AND   #$DF                           
284B- 6D 3B 28             ADC   L283B                          
284E- 8D 3B 28             STA   L283B                          
2851- 2E 3B 28             ROL   L283B                          
2854- C8                   INY                                  
2855- CC 3E 28             CPY   L283E                          
2858- D0 ED                BNE   L2847                          
285A- 98                   TYA                                  
285B- 0A                   ASL                                  
285C- 0A        L285C      ASL                                  
285D- 0A                   ASL                                  
285E- 0A                   ASL                                  
285F- A8                   TAY                                  
2860- 4D 3B 28             EOR   L283B                          
2863- 69 0B                ADC   #$0B                           
2865- D0 03                BNE   L286A                          
2867- A5 0C                LDA   $0C                            
2869- 60                   RTS                                  
286A- A9 00     L286A      LDA   #$00                           
286C- 60                   RTS                                  
286D- 08        L286D      PHP                                  
286E- A5 11                LDA   $11                            
2870- 29 07                AND   #$07                           
2872- 0A                   ASL                                  
2873- A8                   TAY                                  
2874- 0A                   ASL                                  
2875- 0A                   ASL                                  
2876- 0A                   ASL                                  
2877- 20 B6 27  L2877      JSR   L27B6                          
287A- 28                   PLP                                  
287B- 6A                   ROR                                  
287C- 10 04                BPL   L2882                          
287E- E8                   INX                                  
287F- 9D 32 BF             STA   $BF32,X                        
2882- 8E 31 BF  L2882      STX   $BF31                          
2885- 0A                   ASL                                  
2886- AD B4 26             LDA   L26B4                          
2889- 99 10 BF             STA   $BF10,Y                        
288C- 90 03                BCC   L2891                          
288E- 99 20 BF             STA   $BF20,Y                        
2891- AD B5 26  L2891      LDA   L26B5                          
2894- 99 11 BF             STA   $BF11,Y                        
2897- 90 03                BCC   L289C                          
2899- 99 21 BF             STA   $BF21,Y                        
289C- 60        L289C      RTS                                  
289D- 20 03 29  L289D      JSR   L2903                          
28A0- A5 11                LDA   $11                            
28A2- 8D B5 26             STA   L26B5                          
28A5- AD B4 26             LDA   L26B4                          
28A8- 8D CF 28             STA   L28CF                          
28AB- 18                   CLC                                  
28AC- 69 03                ADC   #$03                           
28AE- 8D D2 28             STA   L28D2                          
28B1- AD B5 26             LDA   L26B5                          
28B4- 8D D3 28             STA   L28D3                          
28B7- 8D D0 28             STA   L28D0                          
28BA- 0A                   ASL                                  
28BB- 0A                   ASL                                  
28BC- 0A                   ASL                                  
28BD- 0A                   ASL                                  
28BE- 85 43                STA   A4H                            
28C0- A9 00                LDA   #$00                           
28C2- 85 42                STA   A4L                            
28C4- 85 44                STA   A5L                            
28C6- 85 46                STA   $46                            
28C8- 85 47                STA   $47                            
28CA- A9 10                LDA   #$10                           
28CC- 85 45                STA   A5H                            
28CE- 20 00 00             JSR   $0000                          
28D1- 20 00 00             JSR   $0000                          
28D4- 00                   BRK                                  
28D5- 21 29                AND   (BASH,X)                       
28D7- AD AC 26             LDA   L26AC                          
28DA- F0 24                BEQ   L2900                          
28DC- C9 02                CMP   #$02                           
28DE- 20 6D 28             JSR   L286D                          
28E1- A5 11                LDA   $11                            
28E3- C9 C5                CMP   #$C5                           
28E5- D0 19                BNE   L2900                          
28E7- 2C B7 26             BIT   L26B7                          
28EA- 10 14                BPL   L2900                          
28EC- AD AC 26             LDA   L26AC                          
28EF- C9 03                CMP   #$03                           
28F1- 90 0D                BCC   L2900                          
28F3- C9 04                CMP   #$04                           
28F5- A9 C2                LDA   #$C2                           
28F7- 85 11                STA   $11                            
28F9- 20 6D 28             JSR   L286D                          
28FC- A9 C5                LDA   #$C5                           
28FE- 85 11                STA   $11                            
2900- 4C 37 27  L2900      JMP   L2737                          
2903- A0 FE     L2903      LDY   #$FE                           
2905- B1 10                LDA   ($10),Y                        
2907- 4A                   LSR                                  
2908- 4A                   LSR                                  
2909- 4A                   LSR                                  
290A- 4A                   LSR                                  
290B- 85 12                STA   $12                            
290D- 60                   RTS                                  
290E- AD FF CF  L290E      LDA   CLRROM                         
2911- A0 05                LDY   #$05                           
2913- B1 10     L2913      LDA   ($10),Y                        
2915- D9 33 28             CMP   L2833,Y                        
2918- 38                   SEC                                  
2919- D0 05                BNE   L2920                          
291B- 88                   DEY                                  
291C- 88                   DEY                                  
291D- 10 F4                BPL   L2913                          
291F- 18                   CLC                                  
2920- 60        L2920      RTS                                  
2921- 03                   ???                                  
2922- 00                   BRK                                  
2923- AC 26 00             LDY   GBASL                          
2926- 86 10     L2926      STX   $10                            
2928- 84 11                STY   $11                            
292A- AD 68 C0             LDA   $C068                          
292D- 29 FE                AND   #$FE                           
292F- 8D 68 C0             STA   $C068                          
2932- A0 00     L2932      LDY   #$00                           
2934- B1 10                LDA   ($10),Y                        
2936- C9 05                CMP   #$05                           
2938- B0 72                BCS   L29AC                          
293A- AA                   TAX                                  
293B- C8                   INY                                  
293C- B1 10                LDA   ($10),Y                        
293E- 85 14                STA   $14                            
2940- C8                   INY                                  
2941- B1 10                LDA   ($10),Y                        
2943- 85 15                STA   $15                            
2945- C8                   INY                                  
2946- B1 10                LDA   ($10),Y                        
2948- 85 16                STA   $16                            
294A- C8                   INY                                  
294B- B1 10                LDA   ($10),Y                        
294D- 85 17                STA   $17                            
294F- 30 5D                BMI   L29AE                          
2951- 8A                   TXA                                  
2952- F0 63                BEQ   L29B7                          
2954- C8                   INY                                  
2955- B1 10                LDA   ($10),Y                        
2957- 85 12                STA   $12                            
2959- 85 18                STA   $18                            
295B- C8                   INY                                  
295C- 18                   CLC                                  
295D- 65 16                ADC   $16                            
295F- 85 1A                STA   $1A                            
2961- B1 10                LDA   ($10),Y                        
2963- 85 13                STA   $13                            
2965- 85 19                STA   $19                            
2967- 65 17                ADC   $17                            
2969- 85 1B                STA   $1B                            
296B- CA                   DEX                                  
296C- F0 6D                BEQ   L29DB                          
296E- 8E 05 2B             STX   L2B05                          
2971- C8                   INY                                  
2972- B1 10                LDA   ($10),Y                        
2974- 8D 06 2B             STA   L2B06                          
2977- AA                   TAX                                  
2978- C8        L2978      INY                                  
2979- B1 10                LDA   ($10),Y                        
297B- 9D 07 2B             STA   L2B07,X                        
297E- CA                   DEX                                  
297F- 10 F7                BPL   L2978                          
2981- AE 06 2B             LDX   L2B06                          
2984- C8        L2984      INY                                  
2985- B1 10                LDA   ($10),Y                        
2987- 9D 0F 2B             STA   L2B0F,X                        
298A- CA                   DEX                                  
298B- 10 F7                BPL   L2984                          
298D- AE 06 2B             LDX   L2B06                          
2990- C8        L2990      INY                                  
2991- B1 10                LDA   ($10),Y                        
2993- 9D 17 2B             STA   L2B17,X                        
2996- CA                   DEX                                  
2997- 10 F7                BPL   L2990                          
2999- 20 E1 29             JSR   L29E1                          
299C- AE 05 2B             LDX   L2B05                          
299F- E0 03                CPX   #$03                           
29A1- F0 0E                BEQ   L29B1                          
29A3- 20 43 2A             JSR   L2A43                          
29A6- 20 EC 29  L29A6      JSR   L29EC                          
29A9- 4C 32 29             JMP   L2932                          
29AC- 18        L29AC      CLC                                  
29AD- 60                   RTS                                  
29AE- 4C 79 2A  L29AE      JMP   L2A79                          
29B1- 20 55 2A  L29B1      JSR   L2A55                          
29B4- 4C A6 29             JMP   L29A6                          
29B7- 20 E1 29  L29B7      JSR   L29E1                          
29BA- A9 00                LDA   #$00                           
29BC- A4 17                LDY   $17                            
29BE- F0 0C                BEQ   L29CC                          
29C0- A8                   TAY                                  
29C1- 91 14     L29C1      STA   ($14),Y                        
29C3- C8                   INY                                  
29C4- D0 FB                BNE   L29C1                          
29C6- E6 15                INC   $15                            
29C8- C6 17                DEC   $17                            
29CA- D0 F5                BNE   L29C1                          
29CC- A4 16     L29CC      LDY   $16                            
29CE- F0 08                BEQ   L29D8                          
29D0- A8                   TAY                                  
29D1- 91 14     L29D1      STA   ($14),Y                        
29D3- C8                   INY                                  
29D4- C4 16                CPY   $16                            
29D6- 90 F9                BCC   L29D1                          
29D8- 4C 32 29  L29D8      JMP   L2932                          
29DB- 20 E1 29  L29DB      JSR   L29E1                          
29DE- 4C A6 29             JMP   L29A6                          
29E1- 98        L29E1      TYA                                  
29E2- 38                   SEC                                  
29E3- 65 10                ADC   $10                            
29E5- 85 10                STA   $10                            
29E7- 90 02                BCC   L29EB                          
29E9- E6 11                INC   $11                            
29EB- 60        L29EB      RTS                                  
29EC- A5 13     L29EC      LDA   $13                            
29EE- C5 15                CMP   $15                            
29F0- 90 0B                BCC   L29FD                          
29F2- D0 2C                BNE   L2A20                          
29F4- A5 12                LDA   $12                            
29F6- C5 14                CMP   $14                            
29F8- 90 03                BCC   L29FD                          
29FA- D0 24                BNE   L2A20                          
29FC- 60                   RTS                                  
29FD- A4 17     L29FD      LDY   $17                            
29FF- 98                   TYA                                  
2A00- 18                   CLC                                  
2A01- 65 13                ADC   $13                            
2A03- 85 13                STA   $13                            
2A05- 98                   TYA                                  
2A06- 18                   CLC                                  
2A07- 65 15                ADC   $15                            
2A09- 85 15                STA   $15                            
2A0B- A4 16                LDY   $16                            
2A0D- F0 08                BEQ   L2A17                          
2A0F- 88        L2A0F      DEY                                  
2A10- B1 12                LDA   ($12),Y                        
2A12- 91 14                STA   ($14),Y                        
2A14- 98                   TYA                                  
2A15- D0 F8                BNE   L2A0F                          
2A17- C6 15     L2A17      DEC   $15                            
2A19- C6 13                DEC   $13                            
2A1B- C6 17                DEC   $17                            
2A1D- 10 F0                BPL   L2A0F                          
2A1F- 60                   RTS                                  
2A20- A0 00     L2A20      LDY   #$00                           
2A22- A5 17                LDA   $17                            
2A24- F0 0F                BEQ   L2A35                          
2A26- B1 12     L2A26      LDA   ($12),Y                        
2A28- 91 14                STA   ($14),Y                        
2A2A- C8                   INY                                  
2A2B- D0 F9                BNE   L2A26                          
2A2D- E6 15                INC   $15                            
2A2F- E6 13                INC   $13                            
2A31- C6 17                DEC   $17                            
2A33- D0 F1                BNE   L2A26                          
2A35- A5 16     L2A35      LDA   $16                            
2A37- F0 09                BEQ   L2A42                          
2A39- B1 12     L2A39      LDA   ($12),Y                        
2A3B- 91 14                STA   ($14),Y                        
2A3D- C8                   INY                                  
2A3E- C4 16                CPY   $16                            
2A40- D0 F7                BNE   L2A39                          
2A42- 60        L2A42      RTS                                  
2A43- AC 05 2B  L2A43      LDY   L2B05                          
2A46- 88                   DEY                                  
2A47- B1 18                LDA   ($18),Y                        
2A49- 20 81 2A             JSR   L2A81                          
2A4C- AD 05 2B             LDA   L2B05                          
2A4F- 20 9D 2A             JSR   L2A9D                          
2A52- 90 EF                BCC   L2A43                          
2A54- 60                   RTS                                  
2A55- A0 00     L2A55      LDY   #$00                           
2A57- B1 18                LDA   ($18),Y                        
2A59- 20 B0 2A             JSR   L2AB0                          
2A5C- F0 11                BEQ   L2A6F                          
2A5E- C9 03                CMP   #$03                           
2A60- D0 07                BNE   L2A69                          
2A62- A0 02                LDY   #$02                           
2A64- 20 81 2A             JSR   L2A81                          
2A67- A9 03                LDA   #$03                           
2A69- 20 9D 2A  L2A69      JSR   L2A9D                          
2A6C- 90 E7                BCC   L2A55                          
2A6E- 60                   RTS                                  
2A6F- 68        L2A6F      PLA                                  
2A70- 68                   PLA                                  
2A71- A6 18                LDX   $18                            
2A73- A4 19                LDY   $19                            
2A75- A9 FF                LDA   #$FF                           
2A77- 38                   SEC                                  
2A78- 60                   RTS                                  
2A79- A6 10     L2A79      LDX   $10                            
2A7B- A4 11                LDY   $11                            
2A7D- A9 00                LDA   #$00                           
2A7F- 38                   SEC                                  
2A80- 60                   RTS                                  
2A81- B1 18     L2A81      LDA   ($18),Y                        
2A83- AE 06 2B             LDX   L2B06                          
2A86- DD 07 2B  L2A86      CMP   L2B07,X                        
2A89- 90 07                BCC   L2A92                          
2A8B- DD 0F 2B             CMP   L2B0F,X                        
2A8E- 90 06                BCC   L2A96                          
2A90- F0 04                BEQ   L2A96                          
2A92- CA        L2A92      DEX                                  
2A93- 10 F1                BPL   L2A86                          
2A95- 60                   RTS                                  
2A96- 18        L2A96      CLC                                  
2A97- 7D 17 2B             ADC   L2B17,X                        
2A9A- 91 18                STA   ($18),Y                        
2A9C- 60                   RTS                                  
2A9D- 18        L2A9D      CLC                                  
2A9E- 65 18                ADC   $18                            
2AA0- A4 19                LDY   $19                            
2AA2- 90 01                BCC   L2AA5                          
2AA4- C8                   INY                                  
2AA5- C4 1B     L2AA5      CPY   $1B                            
2AA7- 90 02                BCC   L2AAB                          
2AA9- C5 1A                CMP   $1A                            
2AAB- 85 18     L2AAB      STA   $18                            
2AAD- 84 19                STY   $19                            
2AAF- 60                   RTS                                  
2AB0- 48        L2AB0      PHA                                  
2AB1- 29 03                AND   #$03                           
2AB3- A8                   TAY                                  
2AB4- 68                   PLA                                  
2AB5- 4A                   LSR                                  
2AB6- 4A                   LSR                                  
2AB7- AA                   TAX                                  
2AB8- BD C5 2A             LDA   L2AC5,X                        
2ABB- 88        L2ABB      DEY                                  
2ABC- 30 04                BMI   L2AC2                          
2ABE- 4A                   LSR                                  
2ABF- 4A                   LSR                                  
2AC0- D0 F9                BNE   L2ABB                          
2AC2- 29 03     L2AC2      AND   #$03                           
2AC4- 60                   RTS                                  
2AC5- 09 28     L2AC5      ORA   #$28                           
2AC7- 19 3C 0A             ORA   $0A3C,Y                        
2ACA- 28                   PLP                                  
2ACB- 0D 3C 0B             ORA   $0B3C                          
2ACE- 2A                   ROL                                  
2ACF- 19 3F 0A             ORA   $0A3F,Y                        
2AD2- 28                   PLP                                  
2AD3- 0D 3C 09             ORA   $093C                          
2AD6- 28                   PLP                                  
2AD7- 19 3F 0A             ORA   $0A3F,Y                        
2ADA- 28                   PLP                                  
2ADB- 0D 3C 09             ORA   $093C                          
2ADE- 28                   PLP                                  
2ADF- 19 3F 0A             ORA   $0A3F,Y                        
2AE2- 28                   PLP                                  
2AE3- 0D 3C 08             ORA   $083C                          
2AE6- 2A                   ROL                                  
2AE7- 11 3F                ORA   (A2H),Y                        
2AE9- 0A                   ASL                                  
2AEA- 2A                   ROL                                  
2AEB- 1D 0C 2A             ORA   L2A0C,X                        
2AEE- 2A                   ROL                                  
2AEF- 19 3F 0A             ORA   $0A3F,Y                        
2AF2- 2A                   ROL                                  
2AF3- 1D 3F 0A             ORA   $0A3F,X                        
2AF6- 2A                   ROL                                  
2AF7- 19 3F 0A             ORA   $0A3F,Y                        
2AFA- 28                   PLP                                  
2AFB- 0D 3C 0A             ORA   $0A3C                          
2AFE- 2A                   ROL                                  
2AFF- 19 3F 0A             ORA   $0A3F,Y                        
2B02- 28                   PLP                                  
2B03- 0D 3C 00             ORA   A1L                            
2B06- 00        L2B06      BRK                                  
2B07- 00        L2B07      BRK                                  
2B08- 00                   BRK                                  
2B09- 00                   BRK                                  
2B0A- 00                   BRK                                  
2B0B- 00                   BRK                                  
2B0C- 00                   BRK                                  
2B0D- 00                   BRK                                  
2B0E- 00                   BRK                                  
2B0F- 00        L2B0F      BRK                                  
2B10- 00                   BRK                                  
2B11- 00                   BRK                                  
2B12- 00                   BRK                                  
2B13- 00                   BRK                                  
2B14- 00                   BRK                                  
2B15- 00                   BRK                                  
2B16- 00                   BRK                                  
2B17- 00        L2B17      BRK                                  
2B18- 00        L2B18      BRK                                  
2B19- 00                   BRK                                  
2B1A- 00                   BRK                                  
2B1B- 00                   BRK                                  
2B1C- 00                   BRK                                  
2B1D- 00                   BRK                                  
2B1E- 00                   BRK                                  
2B1F- 08                   PHP                                  
2B20- 78                   SEI                                  
2B21- 18                   CLC                                  
2B22- FB                   ???                                  
2B23- C2 30                ???   COLOR                          
2B25- D4 02                ???   $02                            
2B27- D4 00                ???   $00                            
2B29- 48        L2B29      PHA                                  
2B2A- 48                   PHA                                  
2B2B- F4 00                ???   $00                            
2B2D- 00                   BRK                                  
2B2E- F4 10                ???   $10                            
2B30- 00                   BRK                                  
2B31- F4 01                ???   $01                            
2B33- 31 F4                AND   ($F4),Y                        
2B35- 18                   CLC                                  
2B36- 80 48                BRA   L2B80                          
2B38- 48                   PHA                                  
2B39- A2 02                LDX   #$02                           
2B3B- 09 22                ORA   #$22                           
2B3D- 00                   BRK                                  
2B3E- 00                   BRK                                  
2B3F- E1 68                SBC   ($68,X)                        
2B41- 85 00                STA   $00                            
2B43- 68                   PLA                                  
2B44- 85 02                STA   $02                            
2B46- F4 00                ???   $00                            
2B48- 00                   BRK                                  
2B49- F4 92                ???   $92                            
2B4B- 2B                   ???                                  
2B4C- D4 02                ???   $02                            
2B4E- D4 00                ???   $00                            
2B50- F4 00                ???   $00                            
2B52- 00                   BRK                                  
2B53- F4 10                ???   $10                            
2B55- 00                   BRK                                  
2B56- A2 02                LDX   #$02                           
2B58- 28                   PLP                                  
2B59- 22 00                ???   $00                            
2B5B- 00                   BRK                                  
2B5C- E1 A0                SBC   ($A0,X)                        
2B5E- 02 00                ???   $00                            
2B60- B7 00                ???   $00                            
2B62- AA                   TAX                                  
2B63- A7 00                ???   $00                            
2B65- 8F B1                ???   L2B18                          
2B67- 00                   BRK                                  
2B68- E1 18                SBC   ($18,X)                        
2B6A- 69 0B                ADC   #$0B                           
2B6C- 00                   BRK                                  
2B6D- 8F A9                ???   L2B18                          
2B6F- 00                   BRK                                  
2B70- E1 8A                SBC   ($8A,X)                        
2B72- E2 30                ???   COLOR                          
2B74- 8F B3                ???   L2B29                          
2B76- 00                   BRK                                  
2B77- E1 8F                SBC   ($8F,X)                        
2B79- AB                   ???                                  
2B7A- 00                   BRK                                  
2B7B- E1 A9                SBC   ($A9,X)                        
2B7D- 5C 8F B0             ???   $B08F                          
2B80- 00        L2B80      BRK                                  
2B81- E1 8F                SBC   ($8F,X)                        
2B83- A8                   TAY                                  
2B84- 00                   BRK                                  
2B85- E1 C2                SBC   ($C2,X)                        
2B87- 30 68                BMI   L2BF1                          
2B89- 85 00                STA   $00                            
2B8B- 68                   PLA                                  
2B8C- 85 02                STA   $02                            
2B8E- 38                   SEC                                  
2B8F- FB                   ???                                  
2B90- 28                   PLP                                  
2B91- 60                   RTS                                  
2B92- A3                   ???                                  
2B93- 01 83                ORA   ($83,X)                        
2B95- 07 A3                ???   $A3                            
2B97- 02 83                ???   $83                            
2B99- 08                   PHP                                  
2B9A- 68                   PLA                                  
2B9B- 68                   PLA                                  
2B9C- 68                   PLA                                  
2B9D- A9 FF                LDA   #$FF                           
2B9F- 00                   BRK                                  
2BA0- 38                   SEC                                  
2BA1- 6B                   ???                                  
2BA2- 00                   BRK                                  
2BA3- 00                   BRK                                  
2BA4- 00                   BRK                                  
2BA5- 00                   BRK                                  
2BA6- 00                   BRK                                  
2BA7- 00                   BRK                                  
2BA8- 00                   BRK                                  
2BA9- 00                   BRK                                  
2BAA- 00                   BRK                                  
2BAB- 00                   BRK                                  
2BAC- 00                   BRK                                  
2BAD- 00                   BRK                                  
2BAE- 00                   BRK                                  
2BAF- 00                   BRK                                  
2BB0- 00                   BRK                                  
2BB1- 00                   BRK                                  
2BB2- 00                   BRK                                  
2BB3- 00                   BRK                                  
2BB4- 00                   BRK                                  
2BB5- 00                   BRK                                  
2BB6- 00                   BRK                                  
2BB7- 00                   BRK                                  
2BB8- 00                   BRK                                  
2BB9- 00                   BRK                                  
2BBA- 00                   BRK                                  
2BBB- 00                   BRK                                  
2BBC- 00                   BRK                                  
2BBD- 00                   BRK                                  
2BBE- 00                   BRK                                  
2BBF- 00                   BRK                                  
2BC0- 00                   BRK                                  
2BC1- 00                   BRK                                  
2BC2- 00                   BRK                                  
2BC3- 00                   BRK                                  
2BC4- 00                   BRK                                  
2BC5- 00                   BRK                                  
2BC6- 00                   BRK                                  
2BC7- 00                   BRK                                  
2BC8- 00                   BRK                                  
2BC9- 00                   BRK                                  
2BCA- 00                   BRK                                  
2BCB- 00                   BRK                                  
2BCC- 00                   BRK                                  
2BCD- 00                   BRK                                  
2BCE- 00                   BRK                                  
2BCF- 00                   BRK                                  
2BD0- 00                   BRK                                  
2BD1- 00                   BRK                                  
2BD2- 00                   BRK                                  
2BD3- 00                   BRK                                  
2BD4- 00                   BRK                                  
2BD5- 00                   BRK                                  
2BD6- 00                   BRK                                  
2BD7- 00                   BRK                                  
2BD8- 00                   BRK                                  
2BD9- 00                   BRK                                  
2BDA- 00                   BRK                                  
2BDB- 00                   BRK                                  
2BDC- 00                   BRK                                  
2BDD- 00                   BRK                                  
2BDE- 00                   BRK                                  
2BDF- 00                   BRK                                  
2BE0- 00                   BRK                                  
2BE1- 00                   BRK                                  
2BE2- 00                   BRK                                  
2BE3- 00                   BRK                                  
2BE4- 00                   BRK                                  
2BE5- 00                   BRK                                  
2BE6- 00                   BRK                                  
2BE7- 00                   BRK                                  
2BE8- 00                   BRK                                  
2BE9- 00                   BRK                                  
2BEA- 00                   BRK                                  
2BEB- 00                   BRK                                  
2BEC- 00                   BRK                                  
2BED- 00                   BRK                                  
2BEE- 00                   BRK                                  
2BEF- 00                   BRK                                  
2BF0- 00                   BRK                                  
2BF1- 00        L2BF1      BRK                                  
2BF2- 00                   BRK                                  
2BF3- 00                   BRK                                  
2BF4- 00                   BRK                                  
2BF5- 00                   BRK                                  
2BF6- 00                   BRK                                  
2BF7- 00                   BRK                                  
2BF8- 00                   BRK                                  
2BF9- 00                   BRK                                  
2BFA- 00                   BRK                                  
2BFB- 00                   BRK                                  
2BFC- 00                   BRK                                  
2BFD- 00                   BRK                                  
2BFE- 00                   BRK                                  
2BFF- 00                   BRK                                  
2C00- A0 99     L2C00      LDY   #$99                           
2C02- B9 00 2F  L2C02      LDA   L2F00,Y                        
2C05- 99 00 FF             STA   $FF00,Y                        
2C08- 88                   DEY                                  
2C09- C0 FF                CPY   #$FF                           
2C0B- D0 F5                BNE   L2C02                          
2C0D- A2 00                LDX   #$00                           
2C0F- 86 3C                STX   A1L                            
2C11- CA                   DEX                                  
2C12- 86 3E                STX   A2L                            
2C14- A2 2D                LDX   #$2D                           
2C16- 86 3D                STX   A1H                            
2C18- E8                   INX                                  
2C19- 86 3F                STX   A2H                            
2C1B- A9 00                LDA   #$00                           
2C1D- 85 42                STA   A4L                            
2C1F- A9 02                LDA   #$02                           
2C21- 85 43                STA   A4H                            
2C23- 38                   SEC                                  
2C24- 20 11 C3             JSR   $C311                          
2C27- A9 00                LDA   #$00                           
2C29- 8D 26 BF             STA   $BF26                          
2C2C- A9 FF                LDA   #$FF                           
2C2E- 8D 27 BF             STA   $BF27                          
2C31- EE 31 BF             INC   $BF31                          
2C34- AE 31 BF             LDX   $BF31                          
2C37- A9 BF                LDA   #$BF                           
2C39- 9D 32 BF             STA   $BF32,X                        
2C3C- 60                   RTS                                  
2C3D- 00                   BRK                                  
2C3E- 00                   BRK                                  
2C3F- 00                   BRK                                  
2C40- 00                   BRK                                  
2C41- 00                   BRK                                  
2C42- 00                   BRK                                  
2C43- 00                   BRK                                  
2C44- 00                   BRK                                  
2C45- 00                   BRK                                  
2C46- 00                   BRK                                  
2C47- 00                   BRK                                  
2C48- 00                   BRK                                  
2C49- 00                   BRK                                  
2C4A- 00                   BRK                                  
2C4B- 00                   BRK                                  
2C4C- 00                   BRK                                  
2C4D- 00                   BRK                                  
2C4E- 00                   BRK                                  
2C4F- 00                   BRK                                  
2C50- 00                   BRK                                  
2C51- 00                   BRK                                  
2C52- 00                   BRK                                  
2C53- 00                   BRK                                  
2C54- 00                   BRK                                  
2C55- 00                   BRK                                  
2C56- 00                   BRK                                  
2C57- 00                   BRK                                  
2C58- 00                   BRK                                  
2C59- 00                   BRK                                  
2C5A- 00                   BRK                                  
2C5B- 00                   BRK                                  
2C5C- 00                   BRK                                  
2C5D- 00                   BRK                                  
2C5E- 00                   BRK                                  
2C5F- 00                   BRK                                  
2C60- 00                   BRK                                  
2C61- 00                   BRK                                  
2C62- 00                   BRK                                  
2C63- 00                   BRK                                  
2C64- 00                   BRK                                  
2C65- 00                   BRK                                  
2C66- 00                   BRK                                  
2C67- 00                   BRK                                  
2C68- 00                   BRK                                  
2C69- 00                   BRK                                  
2C6A- 00                   BRK                                  
2C6B- 00                   BRK                                  
2C6C- 00                   BRK                                  
2C6D- 00                   BRK                                  
2C6E- 00                   BRK                                  
2C6F- 00                   BRK                                  
2C70- 00        L2C70      BRK                                  
2C71- 00                   BRK                                  
2C72- 00                   BRK                                  
2C73- 00                   BRK                                  
2C74- 00                   BRK                                  
2C75- 00                   BRK                                  
2C76- 00                   BRK                                  
2C77- 00                   BRK                                  
2C78- 00                   BRK                                  
2C79- 00                   BRK                                  
2C7A- 00                   BRK                                  
2C7B- 00                   BRK                                  
2C7C- 00                   BRK                                  
2C7D- 00                   BRK                                  
2C7E- 00                   BRK                                  
2C7F- 00                   BRK                                  
2C80- 00                   BRK                                  
2C81- 00                   BRK                                  
2C82- 00                   BRK                                  
2C83- 00                   BRK                                  
2C84- 00                   BRK                                  
2C85- 00                   BRK                                  
2C86- 00                   BRK                                  
2C87- 00                   BRK                                  
2C88- 00                   BRK                                  
2C89- 00                   BRK                                  
2C8A- 00                   BRK                                  
2C8B- 00                   BRK                                  
2C8C- 00                   BRK                                  
2C8D- 00                   BRK                                  
2C8E- 00                   BRK                                  
2C8F- 00                   BRK                                  
2C90- 00                   BRK                                  
2C91- 00                   BRK                                  
2C92- 00                   BRK                                  
2C93- 00                   BRK                                  
2C94- 00                   BRK                                  
2C95- 00                   BRK                                  
2C96- 00                   BRK                                  
2C97- 00                   BRK                                  
2C98- 00                   BRK                                  
2C99- 00                   BRK                                  
2C9A- 00                   BRK                                  
2C9B- 00                   BRK                                  
2C9C- 00                   BRK                                  
2C9D- 00                   BRK                                  
2C9E- 00                   BRK                                  
2C9F- 00                   BRK                                  
2CA0- 00                   BRK                                  
2CA1- 00                   BRK                                  
2CA2- 00                   BRK                                  
2CA3- 00                   BRK                                  
2CA4- 00                   BRK                                  
2CA5- 00                   BRK                                  
2CA6- 00                   BRK                                  
2CA7- 00                   BRK                                  
2CA8- 00                   BRK                                  
2CA9- 00                   BRK                                  
2CAA- 00                   BRK                                  
2CAB- 00                   BRK                                  
2CAC- 00                   BRK                                  
2CAD- 00                   BRK                                  
2CAE- 00                   BRK                                  
2CAF- 00                   BRK                                  
2CB0- 00                   BRK                                  
2CB1- 00                   BRK                                  
2CB2- 00                   BRK                                  
2CB3- 00                   BRK                                  
2CB4- 00                   BRK                                  
2CB5- 00                   BRK                                  
2CB6- 00                   BRK                                  
2CB7- 00                   BRK                                  
2CB8- 00                   BRK                                  
2CB9- 00                   BRK                                  
2CBA- 00                   BRK                                  
2CBB- 00                   BRK                                  
2CBC- 00                   BRK                                  
2CBD- 00                   BRK                                  
2CBE- 00                   BRK                                  
2CBF- 00                   BRK                                  
2CC0- 00                   BRK                                  
2CC1- 00                   BRK                                  
2CC2- 00                   BRK                                  
2CC3- 00                   BRK                                  
2CC4- 00                   BRK                                  
2CC5- 00                   BRK                                  
2CC6- 00                   BRK                                  
2CC7- 00                   BRK                                  
2CC8- 00                   BRK                                  
2CC9- 00                   BRK                                  
2CCA- 00                   BRK                                  
2CCB- 00                   BRK                                  
2CCC- 00                   BRK                                  
2CCD- 00                   BRK                                  
2CCE- 00                   BRK                                  
2CCF- 00                   BRK                                  
2CD0- 00                   BRK                                  
2CD1- 00                   BRK                                  
2CD2- 00                   BRK                                  
2CD3- 00                   BRK                                  
2CD4- 00                   BRK                                  
2CD5- 00                   BRK                                  
2CD6- 00                   BRK                                  
2CD7- 00                   BRK                                  
2CD8- 00                   BRK                                  
2CD9- 00                   BRK                                  
2CDA- 00                   BRK                                  
2CDB- 00                   BRK                                  
2CDC- 00                   BRK                                  
2CDD- 00                   BRK                                  
2CDE- 00                   BRK                                  
2CDF- 00                   BRK                                  
2CE0- 00                   BRK                                  
2CE1- 00                   BRK                                  
2CE2- 00                   BRK                                  
2CE3- 00                   BRK                                  
2CE4- 00                   BRK                                  
2CE5- 00                   BRK                                  
2CE6- 00                   BRK                                  
2CE7- 00                   BRK                                  
2CE8- 00                   BRK                                  
2CE9- 00                   BRK                                  
2CEA- 00                   BRK                                  
2CEB- 00                   BRK                                  
2CEC- 00                   BRK                                  
2CED- 00                   BRK                                  
2CEE- 00                   BRK                                  
2CEF- 00                   BRK                                  
2CF0- 00                   BRK                                  
2CF1- 00                   BRK                                  
2CF2- 00                   BRK                                  
2CF3- 00                   BRK                                  
2CF4- 00                   BRK                                  
2CF5- 00                   BRK                                  
2CF6- 00                   BRK                                  
2CF7- 00                   BRK                                  
2CF8- 00                   BRK                                  
2CF9- 00                   BRK                                  
2CFA- 00                   BRK                                  
2CFB- 00                   BRK                                  
2CFC- 00                   BRK                                  
2CFD- 00                   BRK                                  
2CFE- 00                   BRK                                  
2CFF- 00                   BRK                                  
2D00- AD 18 C0             LDA   RD80STORE                      
2D03- 48                   PHA                                  
2D04- 8D 00 C0             STA   KBD                            
2D07- A2 04                LDX   #$04                           
2D09- B5 42     L2D09      LDA   A4L,X                          
2D0B- 9D BD 03             STA   $03BD,X                        
2D0E- CA                   DEX                                  
2D0F- 10 F8                BPL   L2D09                          
2D11- 2D BC 03             AND   $03BC                          
2D14- D0 39                BNE   L2D4F                          
2D16- A6 46                LDX   $46                            
2D18- A9 0E                LDA   #$0E                           
2D1A- 20 33 03             JSR   $0333                          
2D1D- A0 03                LDY   #$03                           
2D1F- B9 D2 03  L2D1F      LDA   $03D2,Y                        
2D22- 99 04 0E             STA   $0E04,Y                        
2D25- 88                   DEY                                  
2D26- 10 F7                BPL   L2D1F                          
2D28- A9 FE                LDA   #$FE                           
2D2A- 8D D1 03             STA   $03D1                          
2D2D- 98                   TYA                                  
2D2E- A0 0E                LDY   #$0E                           
2D30- 99 C2 03  L2D30      STA   $03C2,Y                        
2D33- 88                   DEY                                  
2D34- D0 FA                BNE   L2D30                          
2D36- 8C C2 03             STY   $03C2                          
2D39- A0 07                LDY   #$07                           
2D3B- B9 D6 03  L2D3B      LDA   DOSFM,Y                        
2D3E- 99 22 0E             STA   $0E22,Y                        
2D41- 88                   DEY                                  
2D42- 10 F7                BPL   L2D3B                          
2D44- AD BC 03             LDA   $03BC                          
2D47- D0 61                BNE   L2DAA                          
2D49- 8C BC 03             STY   $03BC                          
2D4C- 8E C1 03             STX   $03C1                          
2D4F- 0E C1 03  L2D4F      ASL   $03C1                          
2D52- AD C1 03             LDA   $03C1                          
2D55- C9 BF                CMP   #$BF                           
2D57- B0 0A                BCS   L2D63                          
2D59- C9 06                CMP   #$06                           
2D5B- D0 03                BNE   L2D60                          
2D5D- 4C 8C 03             JMP   $038C                          
2D60- 4C 42 03  L2D60      JMP   $0342                          
2D63- AA        L2D63      TAX                                  
2D64- 20 E5 02             JSR   $02E5                          
2D67- 08                   PHP                                  
2D68- B0 4E                BCS   L2DB8                          
2D6A- 8A                   TXA                                  
2D6B- C9 CF                CMP   #$CF                           
2D6D- B0 04                BCS   L2D73                          
2D6F- 09 10                ORA   #$10                           
2D71- D0 06                BNE   L2D79                          
2D73- 8D 83 C0  L2D73      STA   PHASE1ON                       
2D76- 8D 83 C0             STA   PHASE1ON                       
2D79- 8D C1 03  L2D79      STA   $03C1                          
2D7C- AD C0 03             LDA   $03C0                          
2D7F- 48                   PHA                                  
2D80- AE BF 03             LDX   $03BF                          
2D83- 8D 09 C0             STA   SETALTZP                       
2D86- A9 0C                LDA   #$0C                           
2D88- 8D C0 03             STA   $03C0                          
2D8B- A9 00                LDA   #$00                           
2D8D- 8D BF 03             STA   $03BF                          
2D90- 20 E5 02             JSR   $02E5                          
2D93- A8                   TAY                                  
2D94- B1 3C     L2D94      LDA   (A1L),Y                        
2D96- 91 42                STA   (A4L),Y                        
2D98- B1 3E                LDA   (A2L),Y                        
2D9A- 91 40                STA   (A3L),Y                        
2D9C- 88                   DEY                                  
2D9D- D0 F5                BNE   L2D94                          
2D9F- 8D 08 C0             STA   CLRALTZP                       
2DA2- 8E BF 03             STX   $03BF                          
2DA5- 68                   PLA                                  
2DA6- 8D C0 03             STA   $03C0                          
2DA9- 28                   PLP                                  
2DAA- B0 09     L2DAA      BCS   L2DB5                          
2DAC- 8D 8B C0             STA   DRV1EN                         
2DAF- 8D 8B C0             STA   DRV1EN                         
2DB2- 20 BE 02             JSR   $02BE                          
2DB5- 4C DE 03  L2DB5      JMP   $03DE                          
2DB8- 20 BE 02  L2DB8      JSR   $02BE                          
2DBB- 4C 6A 02             JMP   $026A                          
2DBE- A9 0C                LDA   #$0C                           
2DC0- 8D C1 03             STA   $03C1                          
2DC3- 20 E5 02             JSR   $02E5                          
2DC6- B0 13                BCS   L2DDB                          
2DC8- 8D 04 C0             STA   CLRRAMWRT                      
2DCB- A8                   TAY                                  
2DCC- B1 3C     L2DCC      LDA   (A1L),Y                        
2DCE- 91 42                STA   (A4L),Y                        
2DD0- B1 3E                LDA   (A2L),Y                        
2DD2- 91 40                STA   (A3L),Y                        
2DD4- 88                   DEY                                  
2DD5- D0 F5                BNE   L2DCC                          
2DD7- 8D 05 C0             STA   SETRAMWRT                      
2DDA- 60                   RTS                                  
2DDB- A9 65     L2DDB      LDA   #$65                           
2DDD- 8D ED 03             STA   $03ED                          
2DE0- A9 FF                LDA   #$FF                           
2DE2- 4C F6 03             JMP   $03F6                          
2DE5- AD BD 03             LDA   $03BD                          
2DE8- 4A                   LSR                                  
2DE9- B0 1D                BCS   L2E08                          
2DEB- AD C0 03             LDA   $03C0                          
2DEE- 85 43                STA   A4H                            
2DF0- 85 41                STA   A3H                            
2DF2- AD BF 03             LDA   $03BF                          
2DF5- 85 42                STA   A4L                            
2DF7- 85 40                STA   A3L                            
2DF9- AD C1 03             LDA   $03C1                          
2DFC- 85 3D                STA   A1H                            
2DFE- 85 3F                STA   A2H                            
2E00- A9 00                LDA   #$00                           
2E02- 85 3C                STA   A1L                            
2E04- 85 3E                STA   A2L                            
2E06- F0 1B                BEQ   L2E23                          
2E08- AD C0 03  L2E08      LDA   $03C0                          
2E0B- 85 3D                STA   A1H                            
2E0D- 85 3F                STA   A2H                            
2E0F- AD BF 03             LDA   $03BF                          
2E12- 85 3C                STA   A1L                            
2E14- 85 3E                STA   A2L                            
2E16- AD C1 03             LDA   $03C1                          
2E19- 85 43                STA   A4H                            
2E1B- 85 41                STA   A3H                            
2E1D- A9 00                LDA   #$00                           
2E1F- 85 42                STA   A4L                            
2E21- 85 40                STA   A3L                            
2E23- E6 3F     L2E23      INC   A2H                            
2E25- E6 41                INC   A3H                            
2E27- 60                   RTS                                  
2E28- 20 31 03  L2E28      JSR   $0331                          
2E2B- 20 C3 02             JSR   $02C3                          
2E2E- 4C DE 03             JMP   $03DE                          
2E31- A9 0C                LDA   #$0C                           
2E33- 8D C1 03             STA   $03C1                          
2E36- 20 E5 02             JSR   $02E5                          
2E39- A8                   TAY                                  
2E3A- 91 3C     L2E3A      STA   (A1L),Y                        
2E3C- 91 3E                STA   (A2L),Y                        
2E3E- 88                   DEY                                  
2E3F- D0 F9                BNE   L2E3A                          
2E41- 60                   RTS                                  
2E42- C9 04                CMP   #$04                           
2E44- D0 04                BNE   L2E4A                          
2E46- A9 07                LDA   #$07                           
2E48- D0 0E                BNE   L2E58                          
2E4A- C9 0F     L2E4A      CMP   #$0F                           
2E4C- 90 DA                BCC   L2E28                          
2E4E- A2 00                LDX   #$00                           
2E50- A5 46                LDA   $46                            
2E52- C9 5D                CMP   #$5D                           
2E54- 90 05                BCC   L2E5B                          
2E56- E9 50                SBC   #$50                           
2E58- 4C 85 03  L2E58      JMP   $0385                          
2E5B- 38        L2E5B      SEC                                  
2E5C- E9 08                SBC   #$08                           
2E5E- C9 11     L2E5E      CMP   #$11                           
2E60- 90 06                BCC   L2E68                          
2E62- E9 11                SBC   #$11                           
2E64- E8                   INX                                  
2E65- 10 F7                BPL   L2E5E                          
2E67- 00                   BRK                                  
2E68- A8        L2E68      TAY                                  
2E69- C0 01                CPY   #$01                           
2E6B- D0 06                BNE   L2E73                          
2E6D- 8A                   TXA                                  
2E6E- 18                   CLC                                  
2E6F- 69 08                ADC   #$08                           
2E71- D0 12                BNE   L2E85                          
2E73- E8        L2E73      INX                                  
2E74- 8A                   TXA                                  
2E75- 0A                   ASL                                  
2E76- 0A                   ASL                                  
2E77- 0A                   ASL                                  
2E78- 0A                   ASL                                  
2E79- 8D C1 03             STA   $03C1                          
2E7C- 98                   TYA                                  
2E7D- F0 02                BEQ   L2E81                          
2E7F- 88                   DEY                                  
2E80- 98                   TYA                                  
2E81- 18        L2E81      CLC                                  
2E82- 6D C1 03             ADC   $03C1                          
2E85- 0A        L2E85      ASL                                  
2E86- 20 C0 02             JSR   $02C0                          
2E89- 4C DE 03             JMP   $03DE                          
2E8C- A9 0C     L2E8C      LDA   #$0C                           
2E8E- 8D C1 03             STA   $03C1                          
2E91- 20 E5 02             JSR   $02E5                          
2E94- B0 13                BCS   L2EA9                          
2E96- 20 36 03             JSR   $0336                          
2E99- A0 0F                LDY   #$0F                           
2E9B- B9 C2 03  L2E9B      LDA   $03C2,Y                        
2E9E- 91 3C                STA   (A1L),Y                        
2EA0- 88                   DEY                                  
2EA1- 10 F8                BPL   L2E9B                          
2EA3- 20 C3 02             JSR   $02C3                          
2EA6- 4C DE 03             JMP   $03DE                          
2EA9- 20 C3 02  L2EA9      JSR   $02C3                          
2EAC- 20 E5 02             JSR   $02E5                          
2EAF- A0 0F                LDY   #$0F                           
2EB1- B1 42     L2EB1      LDA   (A4L),Y                        
2EB3- 99 C2 03             STA   $03C2,Y                        
2EB6- 88                   DEY                                  
2EB7- 10 F8                BPL   L2EB1                          
2EB9- 4C DE 03             JMP   $03DE                          
2EBC- 00                   BRK                                  
2EBD- 00                   BRK                                  
2EBE- 00                   BRK                                  
2EBF- 00                   BRK                                  
2EC0- 00                   BRK                                  
2EC1- 00                   BRK                                  
2EC2- 00                   BRK                                  
2EC3- FF FF                ???   L2EC4                          
2EC5- FF FF                ???   L2EC6                          
2EC7- FF FF                ???   L2EC8                          
2EC9- FF FF                ???   L2ECA                          
2ECB- FF FF                ???   L2ECC                          
2ECD- FF FF                ???   L2ECE                          
2ECF- FF FF                ???   L2ED0                          
2ED1- FE F3 52             INC   L52F3,X                        
2ED4- 41 4D                EOR   ($4D,X)                        
2ED6- C3                   ???                                  
2ED7- 27 0D                ???   $0D                            
2ED9- 00                   BRK                                  
2EDA- 00                   BRK                                  
2EDB- 03                   ???                                  
2EDC- 00                   BRK                                  
2EDD- 7F AD                ???   L2E8C                          
2EDF- 8B                   ???                                  
2EE0- C0 AD                CPY   #$AD                           
2EE2- 8B                   ???                                  
2EE3- C0 68                CPY   #$68                           
2EE5- 10 03                BPL   L2EEA                          
2EE7- 8D 01 C0             STA   SET80STORE                     
2EEA- 4C EF 03  L2EEA      JMP   DOSBRK                         
2EED- 00                   BRK                                  
2EEE- 00                   BRK                                  
2EEF- A9 44                LDA   #$44                           
2EF1- 8D ED 03             STA   $03ED                          
2EF4- A9 FF                LDA   #$FF                           
2EF6- 8D EE 03             STA   $03EE                          
2EF9- 18                   CLC                                  
2EFA- B8                   CLV                                  
2EFB- 4C 14 C3             JMP   $C314                          
2EFE- 00                   BRK                                  
2EFF- 00                   BRK                                  
2F00- D8        L2F00      CLD                                  
2F01- A2 0B                LDX   #$0B                           
2F03- B5 3C     L2F03      LDA   A1L,X                          
2F05- 9D 84 FF             STA   $FF84,X                        
2F08- CA                   DEX                                  
2F09- 10 F8                BPL   L2F03                          
2F0B- A2 01                LDX   #$01                           
2F0D- BD ED 03  L2F0D      LDA   $03ED,X                        
2F10- 9D 82 FF             STA   $FF82,X                        
2F13- CA                   DEX                                  
2F14- 10 F7                BPL   L2F0D                          
2F16- A5 42                LDA   A4L                            
2F18- F0 2A                BEQ   L2F44                          
2F1A- C9 04                CMP   #$04                           
2F1C- B0 1D                BCS   L2F3B                          
2F1E- 49 03                EOR   #$03                           
2F20- 85 42                STA   A4L                            
2F22- F0 08                BEQ   L2F2C                          
2F24- A4 47                LDY   $47                            
2F26- D0 13                BNE   L2F3B                          
2F28- A5 46                LDA   $46                            
2F2A- 30 0F                BMI   L2F3B                          
2F2C- A9 00     L2F2C      LDA   #$00                           
2F2E- 8D ED 03             STA   $03ED                          
2F31- A9 02                LDA   #$02                           
2F33- 8D EE 03             STA   $03EE                          
2F36- 38                   SEC                                  
2F37- B8                   CLV                                  
2F38- 4C 14 C3             JMP   $C314                          
2F3B- A9 27     L2F3B      LDA   #$27                           
2F3D- D0 02                BNE   L2F41                          
2F3F- A9 2B                LDA   #$2B                           
2F41- 38        L2F41      SEC                                  
2F42- B0 03                BCS   L2F47                          
2F44- A9 00     L2F44      LDA   #$00                           
2F46- 18                   CLC                                  
2F47- 08        L2F47      PHP                                  
2F48- 48                   PHA                                  
2F49- A2 0B                LDX   #$0B                           
2F4B- BD 84 FF  L2F4B      LDA   $FF84,X                        
2F4E- 95 3C                STA   A1L,X                          
2F50- CA                   DEX                                  
2F51- 10 F8                BPL   L2F4B                          
2F53- AD 82 FF             LDA   $FF82                          
2F56- 2C 60 60             BIT   L6060                          
2F59- 8D ED 03             STA   $03ED                          
2F5C- AD 83 FF             LDA   $FF83                          
2F5F- 8D EE 03             STA   $03EE                          
2F62- 68                   PLA                                  
2F63- 28                   PLP                                  
2F64- 60                   RTS                                  
2F65- 8D 05 C0             STA   SETRAMWRT                      
2F68- A0 00                LDY   #$00                           
2F6A- B1 3C     L2F6A      LDA   (A1L),Y                        
2F6C- 91 42                STA   (A4L),Y                        
2F6E- B1 3E                LDA   (A2L),Y                        
2F70- 91 40                STA   (A3L),Y                        
2F72- 88                   DEY                                  
2F73- D0 F5                BNE   L2F6A                          
2F75- 8D 04 C0             STA   CLRRAMWRT                      
2F78- A9 DA                LDA   #$DA                           
2F7A- 8D ED 03             STA   $03ED                          
2F7D- A9 02                LDA   #$02                           
2F7F- 4C 33 FF             JMP   $FF33                          
2F82- 00                   BRK                                  
2F83- 00                   BRK                                  
2F84- 00                   BRK                                  
2F85- 00                   BRK                                  
2F86- 00                   BRK                                  
2F87- 00                   BRK                                  
2F88- 00                   BRK                                  
2F89- 00                   BRK                                  
2F8A- 00                   BRK                                  
2F8B- 00                   BRK                                  
2F8C- 00                   BRK                                  
2F8D- 00                   BRK                                  
2F8E- 00                   BRK                                  
2F8F- 00                   BRK                                  
2F90- 00                   BRK                                  
2F91- 00                   BRK                                  
2F92- 00                   BRK                                  
2F93- 00                   BRK                                  
2F94- 00                   BRK                                  
2F95- 00                   BRK                                  
2F96- 00                   BRK                                  
2F97- 00                   BRK                                  
2F98- 00                   BRK                                  
2F99- 00                   BRK                                  
2F9A- 00                   BRK                                  
2F9B- 00                   BRK                                  
2F9C- 00                   BRK                                  
2F9D- 00                   BRK                                  
2F9E- 00                   BRK                                  
2F9F- 00                   BRK                                  
2FA0- 00                   BRK                                  
2FA1- 00                   BRK                                  
2FA2- 00                   BRK                                  
2FA3- 00                   BRK                                  
2FA4- 00                   BRK                                  
2FA5- 00                   BRK                                  
2FA6- 00                   BRK                                  
2FA7- 00                   BRK                                  
2FA8- 00                   BRK                                  
2FA9- 00                   BRK                                  
2FAA- 00                   BRK                                  
2FAB- 00                   BRK                                  
2FAC- 00                   BRK                                  
2FAD- 00                   BRK                                  
2FAE- 00                   BRK                                  
2FAF- 00                   BRK                                  
2FB0- 00                   BRK                                  
2FB1- 00                   BRK                                  
2FB2- 00                   BRK                                  
2FB3- 00                   BRK                                  
2FB4- 00                   BRK                                  
2FB5- 00                   BRK                                  
2FB6- 00                   BRK                                  
2FB7- 00                   BRK                                  
2FB8- 00                   BRK                                  
2FB9- 00                   BRK                                  
2FBA- 00                   BRK                                  
2FBB- 00                   BRK                                  
2FBC- 00                   BRK                                  
2FBD- 00                   BRK                                  
2FBE- 00                   BRK                                  
2FBF- 00                   BRK                                  
2FC0- 00                   BRK                                  
2FC1- 00                   BRK                                  
2FC2- 00                   BRK                                  
2FC3- 00                   BRK                                  
2FC4- 00                   BRK                                  
2FC5- 00                   BRK                                  
2FC6- 00                   BRK                                  
2FC7- 00                   BRK                                  
2FC8- 00                   BRK                                  
2FC9- 00                   BRK                                  
2FCA- 00                   BRK                                  
2FCB- 00                   BRK                                  
2FCC- 00                   BRK                                  
2FCD- 00                   BRK                                  
2FCE- 00                   BRK                                  
2FCF- 00                   BRK                                  
2FD0- 00                   BRK                                  
2FD1- 00                   BRK                                  
2FD2- 00                   BRK                                  
2FD3- 00                   BRK                                  
2FD4- 00                   BRK                                  
2FD5- 00                   BRK                                  
2FD6- 00                   BRK                                  
2FD7- 00                   BRK                                  
2FD8- 00                   BRK                                  
2FD9- 00                   BRK                                  
2FDA- 00                   BRK                                  
2FDB- 00                   BRK                                  
2FDC- 00                   BRK                                  
2FDD- 00                   BRK                                  
2FDE- 00                   BRK                                  
2FDF- 00                   BRK                                  
2FE0- 00                   BRK                                  
2FE1- 00                   BRK                                  
2FE2- 00                   BRK                                  
2FE3- 00                   BRK                                  
2FE4- 00                   BRK                                  
2FE5- 00                   BRK                                  
2FE6- 00                   BRK                                  
2FE7- 00                   BRK                                  
2FE8- 00                   BRK                                  
2FE9- 00                   BRK                                  
2FEA- 00                   BRK                                  
2FEB- 00                   BRK                                  
2FEC- 00                   BRK                                  
2FED- 00                   BRK                                  
2FEE- 00                   BRK                                  
2FEF- 00                   BRK                                  
2FF0- 00                   BRK                                  
2FF1- 00                   BRK                                  
2FF2- 00                   BRK                                  
2FF3- 00                   BRK                                  
2FF4- 00                   BRK                                  
2FF5- 00                   BRK                                  
2FF6- 00                   BRK                                  
2FF7- 00                   BRK                                  
2FF8- 00                   BRK                                  
2FF9- 00                   BRK                                  
2FFA- 00                   BRK                                  
2FFB- 00                   BRK                                  
2FFC- 00                   BRK                                  
2FFD- 00                   BRK                                  
2FFE- 00                   BRK                                  
2FFF- 00                   BRK                                  
3000- D8                   CLD                                  
3001- 68                   PLA                                  
3002- 8D 96 BF             STA   $BF96                          
3005- 8C 9F BF             STY   $BF9F                          
3008- 8E 9E BF             STX   $BF9E                          
300B- 68                   PLA                                  
300C- 85 40                STA   A3L                            
300E- 18                   CLC                                  
300F- 69 04                ADC   #$04                           
3011- 8D 9C BF             STA   $BF9C                          
3014- 68                   PLA                                  
3015- 85 41                STA   A3H                            
3017- 69 00                ADC   #$00                           
3019- 8D 9D BF             STA   $BF9D                          
301C- AD 96 BF             LDA   $BF96                          
301F- 48                   PHA                                  
3020- 28                   PLP                                  
3021- D8                   CLD                                  
3022- A0 00                LDY   #$00                           
3024- 8C 0F BF             STY   $BF0F                          
3027- C8                   INY                                  
3028- B1 40                LDA   (A3L),Y                        
302A- 4A                   LSR                                  
302B- 4A                   LSR                                  
302C- 4A                   LSR                                  
302D- 4A                   LSR                                  
302E- 18                   CLC                                  
302F- 71 40                ADC   (A3L),Y                        
3031- 29 1F                AND   #$1F                           
3033- AA                   TAX                                  
3034- B1 40                LDA   (A3L),Y                        
3036- DD 70 FD             CMP   $FD70,X                        
3039- D0 76                BNE   L30B1                          
303B- C8                   INY                                  
303C- B1 40                LDA   (A3L),Y                        
303E- 48                   PHA                                  
303F- C8                   INY                                  
3040- B1 40                LDA   (A3L),Y                        
3042- 85 41                STA   A3H                            
3044- 68                   PLA                                  
3045- 85 40                STA   A3L                            
3047- A0 00                LDY   #$00                           
3049- BD 90 FD             LDA   $FD90,X                        
304C- F0 1C                BEQ   L306A                          
304E- D1 40                CMP   (A3L),Y                        
3050- D0 63                BNE   L30B5                          
3052- BD 70 FD             LDA   $FD70,X                        
3055- C9 65                CMP   #$65                           
3057- F0 0E                BEQ   L3067                          
3059- 0A                   ASL                                  
305A- 10 14                BPL   L3070                          
305C- B0 1D                BCS   L307B                          
305E- 4A                   LSR                                  
305F- 29 03                AND   #$03                           
3061- 20 01 DF             JSR   $DF01                          
3064- 4C 82 DE             JMP   $DE82                          
3067- 4C 03 BF  L3067      JMP   $BF03                          
306A- 20 06 BF  L306A      JSR   $BF06                          
306D- 4C 82 DE             JMP   $DE82                          
3070- 4A        L3070      LSR                                  
3071- 69 01                ADC   #$01                           
3073- 85 42                STA   A4L                            
3075- 20 BC DE             JSR   $DEBC                          
3078- 4C 82 DE             JMP   $DE82                          
307B- 4A        L307B      LSR                                  
307C- 29 1F                AND   #$1F                           
307E- AA                   TAX                                  
307F- 20 42 E0             JSR   $E042                          
3082- A9 00     L3082      LDA   #$00                           
3084- 8D 95 BF             STA   $BF95                          
3087- AC 0F BF             LDY   $BF0F                          
308A- C0 01                CPY   #$01                           
308C- 98                   TYA                                  
308D- 08                   PHP                                  
308E- 78                   SEI                                  
308F- 4E 9B BF             LSR   $BF9B                          
3092- 68                   PLA                                  
3093- AA                   TAX                                  
3094- AD 9D BF             LDA   $BF9D                          
3097- 48                   PHA                                  
3098- AD 9C BF             LDA   $BF9C                          
309B- 48                   PHA                                  
309C- 8A                   TXA                                  
309D- 48                   PHA                                  
309E- 98                   TYA                                  
309F- AE 9E BF             LDX   $BF9E                          
30A2- AC 9F BF             LDY   $BF9F                          
30A5- 48                   PHA                                  
30A6- AD F4 BF             LDA   $BFF4                          
30A9- 4C A0 BF             JMP   $BFA0                          
30AC- A9 28                LDA   #$28                           
30AE- 20 09 BF             JSR   $BF09                          
30B1- A9 01     L30B1      LDA   #$01                           
30B3- D0 02                BNE   L30B7                          
30B5- A9 04     L30B5      LDA   #$04                           
30B7- 20 E1 DE  L30B7      JSR   $DEE1                          
30BA- B0 C6                BCS   L3082                          
30BC- A0 05                LDY   #$05                           
30BE- 08                   PHP                                  
30BF- 78                   SEI                                  
30C0- B1 40     L30C0      LDA   (A3L),Y                        
30C2- 99 42 00             STA   A4L,Y                          
30C5- 88                   DEY                                  
30C6- D0 F8                BNE   L30C0                          
30C8- A6 45                LDX   A5H                            
30CA- 86 4F                STX   RNDH                           
30CC- E8                   INX                                  
30CD- E8                   INX                                  
30CE- A5 44                LDA   A5L                            
30D0- F0 01                BEQ   L30D3                          
30D2- E8                   INX                                  
30D3- 20 A6 FC  L30D3      JSR   $FCA6                          
30D6- B0 08                BCS   L30E0                          
30D8- 20 E4 DE             JSR   $DEE4                          
30DB- B0 03                BCS   L30E0                          
30DD- 28                   PLP                                  
30DE- 18                   CLC                                  
30DF- 60                   RTS                                  
30E0- 28        L30E0      PLP                                  
30E1- 20 09 BF             JSR   $BF09                          
30E4- A5 43                LDA   A4H                            
30E6- 29 F0                AND   #$F0                           
30E8- 85 43                STA   A4H                            
30EA- 4A                   LSR                                  
30EB- 4A                   LSR                                  
30EC- 4A                   LSR                                  
30ED- AA                   TAX                                  
30EE- BD 10 BF             LDA   $BF10,X                        
30F1- 8D E5 FE             STA   $FEE5                          
30F4- BD 11 BF             LDA   $BF11,X                        
30F7- 8D E6 FE             STA   $FEE6                          
30FA- 6C E5 FE             JMP   ($FEE5)                        
30FD- EA                   NOP                                  
30FE- EA                   NOP                                  
30FF- EA                   NOP                                  
3100- 60                   RTS                                  
3101- 85 42                STA   A4L                            
3103- C9 02                CMP   #$02                           
3105- 90 06                BCC   L310D                          
3107- 20 66 FD             JSR   $FD66                          
310A- B0 2D                BCS   L3139                          
310C- 60                   RTS                                  
310D- 4A        L310D      LSR                                  
310E- B0 2C                BCS   L313C                          
3110- A2 03                LDX   #$03                           
3112- BD 7E BF  L3112      LDA   $BF7E,X                        
3115- D0 16                BNE   L312D                          
3117- A0 03                LDY   #$03                           
3119- B1 40                LDA   (A3L),Y                        
311B- F0 1A                BEQ   L3137                          
311D- 9D 7E BF             STA   $BF7E,X                        
3120- 88                   DEY                                  
3121- B1 40                LDA   (A3L),Y                        
3123- 9D 7D BF             STA   $BF7D,X                        
3126- 8A                   TXA                                  
3127- 4A                   LSR                                  
3128- 88                   DEY                                  
3129- 91 40                STA   (A3L),Y                        
312B- 18                   CLC                                  
312C- 60                   RTS                                  
312D- E8        L312D      INX                                  
312E- E8                   INX                                  
312F- E0 0B                CPX   #$0B                           
3131- D0 DF                BNE   L3112                          
3133- A9 25                LDA   #$25                           
3135- D0 02                BNE   L3139                          
3137- A9 53     L3137      LDA   #$53                           
3139- 20 09 BF  L3139      JSR   $BF09                          
313C- A0 01     L313C      LDY   #$01                           
313E- B1 40                LDA   (A3L),Y                        
3140- F0 F5                BEQ   L3137                          
3142- C9 05                CMP   #$05                           
3144- B0 F1                BCS   L3137                          
3146- 0A                   ASL                                  
3147- AA                   TAX                                  
3148- A9 00                LDA   #$00                           
314A- 9D 7E BF             STA   $BF7E,X                        
314D- 9D 7F BF             STA   $BF7F,X                        
3150- 18                   CLC                                  
3151- 60                   RTS                                  
3152- A5 45                LDA   A5H                            
3154- 8D 88 BF             STA   $BF88                          
3157- 8E 89 BF             STX   $BF89                          
315A- 8C 8A BF             STY   $BF8A                          
315D- BA                   TSX                                  
315E- 8E 8B BF             STX   $BF8B                          
3161- AD F5 DF             LDA   $DFF5                          
3164- D0 0C                BNE   L3172                          
3166- 68                   PLA                                  
3167- 8D 8C BF             STA   $BF8C                          
316A- 68                   PLA                                  
316B- 8D 8E BF             STA   $BF8E                          
316E- 68                   PLA                                  
316F- 8D 8F BF             STA   $BF8F                          
3172- 9A        L3172      TXS                                  
3173- AD F8 07             LDA   $07F8                          
3176- 8D EB DF             STA   $DFEB                          
3179- BA                   TSX                                  
317A- 30 09                BMI   L3185                          
317C- A0 0F                LDY   #$0F                           
317E- 68        L317E      PLA                                  
317F- 99 CF FE             STA   $FECF,Y                        
3182- 88                   DEY                                  
3183- 10 F9                BPL   L317E                          
3185- A2 FA     L3185      LDX   #$FA                           
3187- B5 00     L3187      LDA   $00,X                          
3189- 9D E5 FD             STA   $FDE5,X                        
318C- E8                   INX                                  
318D- D0 F8                BNE   L3187                          
318F- AD 81 BF             LDA   $BF81                          
3192- F0 05                BEQ   L3199                          
3194- 20 F7 DF             JSR   $DFF7                          
3197- 90 28                BCC   L31C1                          
3199- AD 83 BF  L3199      LDA   $BF83                          
319C- F0 05                BEQ   L31A3                          
319E- 20 FA DF             JSR   $DFFA                          
31A1- 90 1E                BCC   L31C1                          
31A3- AD 85 BF  L31A3      LDA   $BF85                          
31A6- F0 05                BEQ   L31AD                          
31A8- 20 FD DF             JSR   $DFFD                          
31AB- 90 14                BCC   L31C1                          
31AD- AD 87 BF  L31AD      LDA   $BF87                          
31B0- F0 05                BEQ   L31B7                          
31B2- 20 00 E0             JSR   $E000                          
31B5- 90 0A                BCC   L31C1                          
31B7- EE F6 DF  L31B7      INC   $DFF6                          
31BA- D0 05                BNE   L31C1                          
31BC- A9 01                LDA   #$01                           
31BE- 20 0C BF             JSR   $BF0C                          
31C1- A2 FA     L31C1      LDX   #$FA                           
31C3- BD E5 FD  L31C3      LDA   $FDE5,X                        
31C6- 95 00                STA   $00,X                          
31C8- E8                   INX                                  
31C9- D0 F8                BNE   L31C3                          
31CB- AE 8B BF             LDX   $BF8B                          
31CE- 30 0B                BMI   L31DB                          
31D0- A0 00                LDY   #$00                           
31D2- B9 CF FE  L31D2      LDA   $FECF,Y                        
31D5- 48                   PHA                                  
31D6- C8                   INY                                  
31D7- C0 10                CPY   #$10                           
31D9- D0 F7                BNE   L31D2                          
31DB- AD F5 DF  L31DB      LDA   $DFF5                          
31DE- D0 12                BNE   L31F2                          
31E0- AC 8A BF             LDY   $BF8A                          
31E3- AE 89 BF             LDX   $BF89                          
31E6- AD FF CF             LDA   CLRROM                         
31E9- AD 00 C1             LDA   $C100                          
31EC- AD EB DF             LDA   $DFEB                          
31EF- 8D F8 07             STA   $07F8                          
31F2- 4C D0 BF  L31F2      JMP   $BFD0                          
31F5- 00                   BRK                                  
31F6- 00                   BRK                                  
31F7- 6C 80 BF             JMP   ($BF80)                        
31FA- 6C 82 BF             JMP   ($BF82)                        
31FD- 6C 84 BF             JMP   ($BF84)                        
3200- 6C 86 BF             JMP   ($BF86)                        
3203- 8D 0F BF             STA   $BF0F                          
3206- 68                   PLA                                  
3207- 68                   PLA                                  
3208- AD 0F BF             LDA   $BF0F                          
320B- 38                   SEC                                  
320C- 60                   RTS                                  
320D- AA                   TAX                                  
320E- 8D 0C C0             STA   CLR80VID                       
3211- AD 51 C0             LDA   TXTSET                         
3214- AD FF FE             LDA   $FEFF                          
3217- F0 05                BEQ   L321E                          
3219- A9 00                LDA   #$00                           
321B- 8D 29 C0             STA   $C029                          
321E- AD 54 C0  L321E      LDA   PAGE2CLR                       
3221- A0 27                LDY   #$27                           
3223- A9 A0     L3223      LDA   #$A0                           
3225- 99 50 07             STA   $0750,Y                        
3228- B9 22 FE             LDA   $FE22,Y                        
322B- 99 D0 07             STA   $07D0,Y                        
322E- 88                   DEY                                  
322F- 10 F2                BPL   L3223                          
3231- 8A                   TXA                                  
3232- 29 0F                AND   #$0F                           
3234- 09 B0                ORA   #$B0                           
3236- C9 BA                CMP   #$BA                           
3238- 90 02                BCC   L323C                          
323A- 69 06                ADC   #$06                           
323C- 8D F7 07  L323C      STA   $07F7                          
323F- 4C 3F E0             JMP   $E03F                          
3242- 8E A7 FE             STX   $FEA7                          
3245- BD D8 FD             LDA   $FDD8,X                        
3248- 0A                   ASL                                  
3249- 8D A3 FE             STA   $FEA3                          
324C- 29 3F                AND   #$3F                           
324E- AA                   TAX                                  
324F- BD B0 FD             LDA   $FDB0,X                        
3252- 8D E5 FE             STA   $FEE5                          
3255- BD B1 FD             LDA   $FDB1,X                        
3258- 8D E6 FE             STA   $FEE6                          
325B- A9 20                LDA   #$20                           
325D- 8D A4 FE             STA   $FEA4                          
3260- 90 05                BCC   L3267                          
3262- 20 85 E0             JSR   $E085                          
3265- B0 17                BCS   L327E                          
3267- 0E A3 FE  L3267      ASL   $FEA3                          
326A- 90 05                BCC   L3271                          
326C- 20 CB E1             JSR   $E1CB                          
326F- B0 0D                BCS   L327E                          
3271- 0E A3 FE  L3271      ASL   $FEA3                          
3274- 90 03                BCC   L3279                          
3276- 20 06 BF             JSR   $BF06                          
3279- 20 82 E0  L3279      JSR   $E082                          
327C- 90 03                BCC   L3281                          
327E- 20 09 BF  L327E      JSR   $BF09                          
3281- 60        L3281      RTS                                  
3282- 6C E5 FE             JMP   ($FEE5)                        
3285- A0 01                LDY   #$01                           
3287- B1 40                LDA   (A3L),Y                        
3289- 85 48                STA   $48                            
328B- C8                   INY                                  
328C- B1 40                LDA   (A3L),Y                        
328E- 85 49                STA   $49                            
3290- A2 00                LDX   #$00                           
3292- A0 00                LDY   #$00                           
3294- 8E AC FE             STX   $FEAC                          
3297- 8E 00 D7             STX   $D700                          
329A- B1 48                LDA   ($48),Y                        
329C- F0 58                BEQ   L32F6                          
329E- C9 41                CMP   #$41                           
32A0- B0 54                BCS   L32F6                          
32A2- 8D 8E FE             STA   $FE8E                          
32A5- EE 8E FE             INC   $FE8E                          
32A8- C8                   INY                                  
32A9- B1 48                LDA   ($48),Y                        
32AB- 09 80                ORA   #$80                           
32AD- C9 AF                CMP   #$AF                           
32AF- D0 04                BNE   L32B5                          
32B1- 8D AC FE             STA   $FEAC                          
32B4- C8                   INY                                  
32B5- A9 FF     L32B5      LDA   #$FF                           
32B7- 9D 00 D7             STA   $D700,X                        
32BA- 8D A8 FE             STA   $FEA8                          
32BD- 8E AA FE             STX   $FEAA                          
32C0- CC 8E FE  L32C0      CPY   $FE8E                          
32C3- B0 35                BCS   L32FA                          
32C5- B1 48                LDA   ($48),Y                        
32C7- 29 7F                AND   #$7F                           
32C9- E8                   INX                                  
32CA- C8                   INY                                  
32CB- C9 2F                CMP   #$2F                           
32CD- F0 40                BEQ   L330F                          
32CF- C9 61                CMP   #$61                           
32D1- 90 02                BCC   L32D5                          
32D3- 29 5F                AND   #$5F                           
32D5- 9D 00 D7  L32D5      STA   $D700,X                        
32D8- EE A8 FE             INC   $FEA8                          
32DB- D0 05                BNE   L32E2                          
32DD- EE A8 FE             INC   $FEA8                          
32E0- D0 0C                BNE   L32EE                          
32E2- C9 2E     L32E2      CMP   #$2E                           
32E4- F0 DA                BEQ   L32C0                          
32E6- C9 30                CMP   #$30                           
32E8- 90 0C                BCC   L32F6                          
32EA- C9 3A                CMP   #$3A                           
32EC- 90 D2                BCC   L32C0                          
32EE- C9 41     L32EE      CMP   #$41                           
32F0- 90 04                BCC   L32F6                          
32F2- C9 5B                CMP   #$5B                           
32F4- 90 CA                BCC   L32C0                          
32F6- 38        L32F6      SEC                                  
32F7- A9 40                LDA   #$40                           
32F9- 60                   RTS                                  
32FA- A9 00     L32FA      LDA   #$00                           
32FC- 2C A8 FE             BIT   $FEA8                          
32FF- 10 04                BPL   L3305                          
3301- 8D A8 FE             STA   $FEA8                          
3304- CA                   DEX                                  
3305- E8        L3305      INX                                  
3306- 9D 00 D7             STA   $D700,X                        
3309- F0 EB                BEQ   L32F6                          
330B- 8E 8E FE             STX   $FE8E                          
330E- AA                   TAX                                  
330F- AD A8 FE  L330F      LDA   $FEA8                          
3312- C9 10                CMP   #$10                           
3314- B0 E0                BCS   L32F6                          
3316- 8E AD FE             STX   $FEAD                          
3319- AE AA FE             LDX   $FEAA                          
331C- 9D 00 D7             STA   $D700,X                        
331F- AE AD FE             LDX   $FEAD                          
3322- D0 91                BNE   L32B5                          
3324- 18                   CLC                                  
3325- AD AC FE             LDA   $FEAC                          
3328- D0 05                BNE   L332F                          
332A- AD 97 BF             LDA   $BF97                          
332D- F0 C7                BEQ   L32F6                          
332F- 60        L332F      RTS                                  
3330- 20 85 E0             JSR   $E085                          
3333- 90 0A                BCC   L333F                          
3335- AC 00 D7             LDY   $D700                          
3338- D0 4C     L3338      BNE   L3386                          
333A- 20 EC FF             JSR   $FFEC                          
333D- 18                   CLC                                  
333E- 60                   RTS                                  
333F- 20 97 E5  L333F      JSR   $E597                          
3342- 90 04                BCC   L3348                          
3344- C9 40                CMP   #$40                           
3346- D0 3E                BNE   L3386                          
3348- AD 4F FE  L3348      LDA   $FE4F                          
334B- 29 D0                AND   #$D0                           
334D- 49 D0                EOR   #$D0                           
334F- D0 33                BNE   L3384                          
3351- AC AC FE             LDY   $FEAC                          
3354- D0 03                BNE   L3359                          
3356- AD 97 BF             LDA   $BF97                          
3359- A8        L3359      TAY                                  
335A- 38                   SEC                                  
335B- ED 8E FE             SBC   $FE8E                          
335E- C9 C0                CMP   #$C0                           
3360- 90 94                BCC   L32F6                          
3362- AA                   TAX                                  
3363- 20 F3 FF             JSR   $FFF3                          
3366- AD 49 FE             LDA   $FE49                          
3369- 8D 8F FE             STA   $FE8F                          
336C- AD 60 FE             LDA   $FE60                          
336F- 8D 90 FE             STA   $FE90                          
3372- AD 61 FE             LDA   $FE61                          
3375- 8D 91 FE             STA   $FE91                          
3378- B9 00 D7  L3378      LDA   $D700,Y                        
337B- 9D 00 D7             STA   $D700,X                        
337E- C8                   INY                                  
337F- E8                   INX                                  
3380- D0 F6                BNE   L3378                          
3382- 18                   CLC                                  
3383- 60                   RTS                                  
3384- A9 4B     L3384      LDA   #$4B                           
3386- 38        L3386      SEC                                  
3387- 60                   RTS                                  
3388- 18                   CLC                                  
3389- A0 01                LDY   #$01                           
338B- B1 40                LDA   (A3L),Y                        
338D- 85 4E                STA   RNDL                           
338F- C8                   INY                                  
3390- B1 40                LDA   (A3L),Y                        
3392- 85 4F                STA   RNDH                           
3394- A9 00                LDA   #$00                           
3396- 8D CB FE             STA   $FECB                          
3399- A9 40                LDA   #$40                           
339B- 8D CA FE             STA   $FECA                          
339E- 20 89 FC             JSR   $FC89                          
33A1- B0 E3                BCS   L3386                          
33A3- A0 00                LDY   #$00                           
33A5- AD 97 BF             LDA   $BF97                          
33A8- AA                   TAX                                  
33A9- F0 04                BEQ   L33AF                          
33AB- 49 FF                EOR   #$FF                           
33AD- 69 02                ADC   #$02                           
33AF- 91 4E     L33AF      STA   (RNDL),Y                       
33B1- F0 16                BEQ   L33C9                          
33B3- C8        L33B3      INY                                  
33B4- BD 00 D7             LDA   $D700,X                        
33B7- 91 4E     L33B7      STA   (RNDL),Y                       
33B9- 29 F0                AND   #$F0                           
33BB- D0 04                BNE   L33C1                          
33BD- A9 2F                LDA   #$2F                           
33BF- D0 F6                BNE   L33B7                          
33C1- E8        L33C1      INX                                  
33C2- D0 EF                BNE   L33B3                          
33C4- C8                   INY                                  
33C5- A9 2F                LDA   #$2F                           
33C7- 91 4E                STA   (RNDL),Y                       
33C9- 18        L33C9      CLC                                  
33CA- 60                   RTS                                  
33CB- A0 01                LDY   #$01                           
33CD- B1 40                LDA   (A3L),Y                        
33CF- F0 5B                BEQ   L342C                          
33D1- C9 09                CMP   #$09                           
33D3- B0 57                BCS   L342C                          
33D5- 48                   PHA                                  
33D6- E9 00                SBC   #$00                           
33D8- 4A                   LSR                                  
33D9- 6A                   ROR                                  
33DA- 6A                   ROR                                  
33DB- 6A                   ROR                                  
33DC- 8D 82 FE             STA   $FE82                          
33DF- A8                   TAY                                  
33E0- 68                   PLA                                  
33E1- D9 00 D8             CMP   $D800,Y                        
33E4- D0 41                BNE   L3427                          
33E6- B9 0B D8             LDA   $D80B,Y                        
33E9- 20 43 FC             JSR   $FC43                          
33EC- AE CE FE             LDX   $FECE                          
33EF- F0 27                BEQ   L3418                          
33F1- 86 4B                STX   $4B                            
33F3- E8                   INX                                  
33F4- E8                   INX                                  
33F5- 86 49                STX   $49                            
33F7- B9 01 D8             LDA   $D801,Y                        
33FA- 8D 30 BF             STA   $BF30                          
33FD- AD CD FE             LDA   $FECD                          
3400- 85 4A                STA   $4A                            
3402- 85 48                STA   $48                            
3404- AA        L3404      TAX                                  
3405- BD 10 D9             LDA   $D910,X                        
3408- D9 01 D8             CMP   $D801,Y                        
340B- F0 10                BEQ   L341D                          
340D- 8A        L340D      TXA                                  
340E- 18                   CLC                                  
340F- 69 20                ADC   #$20                           
3411- 90 F1                BCC   L3404                          
3413- A9 0A                LDA   #$0A                           
3415- 20 0C BF             JSR   $BF0C                          
3418- A9 0B     L3418      LDA   #$0B                           
341A- 20 0C BF             JSR   $BF0C                          
341D- BD 00 D9  L341D      LDA   $D900,X                        
3420- F0 EB                BEQ   L340D                          
3422- 8E 81 FE             STX   $FE81                          
3425- 18                   CLC                                  
3426- 60                   RTS                                  
3427- A9 00     L3427      LDA   #$00                           
3429- 99 82 FE             STA   $FE82,Y                        
342C- A9 43     L342C      LDA   #$43                           
342E- 38                   SEC                                  
342F- 60                   RTS                                  
3430- 20 F7 F1  L3430      JSR   $F1F7                          
3433- A9 00                LDA   #$00                           
3435- 8D CA FE             STA   $FECA                          
3438- 8D CB FE             STA   $FECB                          
343B- A0 01                LDY   #$01                           
343D- B1 40                LDA   (A3L),Y                        
343F- 29 F0                AND   #$F0                           
3441- 8D 30 BF             STA   $BF30                          
3444- F0 07                BEQ   L344D                          
3446- A9 10                LDA   #$10                           
3448- 8D CA FE             STA   $FECA                          
344B- D0 03                BNE   L3450                          
344D- EE CB FE  L344D      INC   $FECB                          
3450- 20 89 FC  L3450      JSR   $FC89                          
3453- B0 33                BCS   L3488                          
3455- A9 00                LDA   #$00                           
3457- AC CA FE             LDY   $FECA                          
345A- 88        L345A      DEY                                  
345B- 91 4E                STA   (RNDL),Y                       
345D- D0 FB                BNE   L345A                          
345F- 8D AA FE             STA   $FEAA                          
3462- AD 30 BF             LDA   $BF30                          
3465- D0 22                BNE   L3489                          
3467- 20 4B E8             JSR   $E84B                          
346A- 8E AD FE  L346A      STX   $FEAD                          
346D- BD BA FE             LDA   $FEBA,X                        
3470- 8D 30 BF             STA   $BF30                          
3473- 20 89 E2             JSR   $E289                          
3476- AD AA FE             LDA   $FEAA                          
3479- 18                   CLC                                  
347A- 69 10                ADC   #$10                           
347C- 8D AA FE             STA   $FEAA                          
347F- AE AD FE             LDX   $FEAD                          
3482- CA                   DEX                                  
3483- 10 E5                BPL   L346A                          
3485- A9 00                LDA   #$00                           
3487- 18                   CLC                                  
3488- 60        L3488      RTS                                  
3489- 20 5D E8  L3489      JSR   $E85D                          
348C- B0 3B                BCS   L34C9                          
348E- A2 00                LDX   #$00                           
3490- A9 02                LDA   #$02                           
3492- 20 CD EB             JSR   $EBCD                          
3495- AE 81 FE             LDX   $FE81                          
3498- 90 0F                BCC   L34A9                          
349A- A8                   TAY                                  
349B- BD 11 D9             LDA   $D911,X                        
349E- D0 06                BNE   L34A6                          
34A0- 9D 00 D9             STA   $D900,X                        
34A3- 9D 10 D9             STA   $D910,X                        
34A6- 98        L34A6      TYA                                  
34A7- B0 20                BCS   L34C9                          
34A9- BD 00 D9  L34A9      LDA   $D900,X                        
34AC- F0 05                BEQ   L34B3                          
34AE- BD 11 D9             LDA   $D911,X                        
34B1- 30 0C                BMI   L34BF                          
34B3- 20 B8 E8  L34B3      JSR   $E8B8                          
34B6- B0 11                BCS   L34C9                          
34B8- A9 57                LDA   #$57                           
34BA- 2C A5 FE             BIT   $FEA5                          
34BD- 30 0A                BMI   L34C9                          
34BF- AE 81 FE  L34BF      LDX   $FE81                          
34C2- 20 10 E9             JSR   $E910                          
34C5- A9 2E                LDA   #$2E                           
34C7- 90 1E                BCC   L34E7                          
34C9- 48        L34C9      PHA                                  
34CA- 20 FC E2             JSR   $E2FC                          
34CD- 68                   PLA                                  
34CE- C8                   INY                                  
34CF- 91 4E                STA   (RNDL),Y                       
34D1- C9 57                CMP   #$57                           
34D3- D0 10                BNE   L34E5                          
34D5- C8                   INY                                  
34D6- AE A6 FE             LDX   $FEA6                          
34D9- BD 10 D9             LDA   $D910,X                        
34DC- 91 4E                STA   (RNDL),Y                       
34DE- A9 00                LDA   #$00                           
34E0- 8D A5 FE             STA   $FEA5                          
34E3- A9 57                LDA   #$57                           
34E5- 38        L34E5      SEC                                  
34E6- 60                   RTS                                  
34E7- BD 00 D9  L34E7      LDA   $D900,X                        
34EA- 8D A8 FE             STA   $FEA8                          
34ED- AC AA FE             LDY   $FEAA                          
34F0- BD 00 D9  L34F0      LDA   $D900,X                        
34F3- 91 4E                STA   (RNDL),Y                       
34F5- E8                   INX                                  
34F6- C8                   INY                                  
34F7- CE A8 FE             DEC   $FEA8                          
34FA- 10 F4                BPL   L34F0                          
34FC- AC AA FE             LDY   $FEAA                          
34FF- AD 30 BF             LDA   $BF30                          
3502- 11 4E                ORA   (RNDL),Y                       
3504- 91 4E                STA   (RNDL),Y                       
3506- 18                   CLC                                  
3507- 60                   RTS                                  
3508- 20 AA E5             JSR   $E5AA                          
350B- B0 04                BCS   L3511                          
350D- A9 47                LDA   #$47                           
350F- 38        L350F      SEC                                  
3510- 60                   RTS                                  
3511- C9 46     L3511      CMP   #$46                           
3513- D0 FA                BNE   L350F                          
3515- A0 07                LDY   #$07                           
3517- B1 40                LDA   (A3L),Y                        
3519- C9 04                CMP   #$04                           
351B- 90 04                BCC   L3521                          
351D- C9 0D                CMP   #$0D                           
351F- D0 10                BNE   L3531                          
3521- AD 30 BF  L3521      LDA   $BF30                          
3524- 20 46 F4             JSR   $F446                          
3527- B0 0B                BCS   L3534                          
3529- AD 8B FE             LDA   $FE8B                          
352C- F0 07                BEQ   L3535                          
352E- 4C C3 E3             JMP   $E3C3                          
3531- A9 4B     L3531      LDA   #$4B                           
3533- 38                   SEC                                  
3534- 60        L3534      RTS                                  
3535- AD 36 FE  L3535      LDA   VERIFY                         
3538- 0D 37 FE             ORA   $FE37                          
353B- D0 04                BNE   L3541                          
353D- A9 49                LDA   #$49                           
353F- 38                   SEC                                  
3540- 60                   RTS                                  
3541- A5 46     L3541      LDA   $46                            
3543- 48                   PHA                                  
3544- A5 47                LDA   $47                            
3546- 48                   PHA                                  
3547- 20 A0 EA             JSR   $EAA0                          
354A- AA                   TAX                                  
354B- 68                   PLA                                  
354C- 85 47                STA   $47                            
354E- 68                   PLA                                  
354F- 85 46                STA   $46                            
3551- 8A                   TXA                                  
3552- B0 E0                BCS   L3534                          
3554- 8D 02 DC             STA   $DC02                          
3557- 8C 03 DC             STY   $DC03                          
355A- 20 D9 EB             JSR   $EBD9                          
355D- B0 D5                BCS   L3534                          
355F- A2 01                LDX   #$01                           
3561- B5 46     L3561      LDA   $46,X                          
3563- 9D 00 DC             STA   $DC00,X                        
3566- BD 02 DC             LDA   $DC02,X                        
3569- 95 46                STA   $46,X                          
356B- CA                   DEX                                  
356C- 10 F3                BPL   L3561                          
356E- E8                   INX                                  
356F- 8A                   TXA                                  
3570- 9D 02 DC  L3570      STA   $DC02,X                        
3573- 9D 00 DD             STA   $DD00,X                        
3576- E8                   INX                                  
3577- D0 F7                BNE   L3570                          
3579- 20 D9 EB             JSR   $EBD9                          
357C- B0 B6                BCS   L3534                          
357E- AD 36 FE             LDA   VERIFY                         
3581- AE 37 FE             LDX   $FE37                          
3584- 20 CD EB             JSR   $EBCD                          
3587- AE 38 FE             LDX   $FE38                          
358A- A9 DC                LDA   #$DC                           
358C- 85 49                STA   $49                            
358E- A9 04                LDA   #$04                           
3590- 18        L3590      CLC                                  
3591- CA                   DEX                                  
3592- F0 09                BEQ   L359D                          
3594- 6D 39 FE             ADC   $FE39                          
3597- 90 F7                BCC   L3590                          
3599- E6 49                INC   $49                            
359B- B0 F3                BCS   L3590                          
359D- 85 48     L359D      STA   $48                            
359F- A0 13                LDY   #$13                           
35A1- B1 48     L35A1      LDA   ($48),Y                        
35A3- 79 D9 FD             ADC   $FDD9,Y                        
35A6- 91 48                STA   ($48),Y                        
35A8- C8                   INY                                  
35A9- 98                   TYA                                  
35AA- 49 18                EOR   #$18                           
35AC- D0 F3                BNE   L35A1                          
35AE- 20 D9 EB             JSR   $EBD9                          
35B1- B0 0F                BCS   L35C2                          
35B3- 4C 08 E3             JMP   $E308                          
35B6- A9 00                LDA   #$00                           
35B8- AA                   TAX                                  
35B9- 9D 00 DC  L35B9      STA   $DC00,X                        
35BC- 9D 00 DD             STA   $DD00,X                        
35BF- E8                   INX                                  
35C0- D0 F7                BNE   L35B9                          
35C2- 60        L35C2      RTS                                  
35C3- 20 B6 E3             JSR   $E3B6                          
35C6- A0 0B                LDY   #$0B                           
35C8- B1 40     L35C8      LDA   (A3L),Y                        
35CA- 99 5F FE             STA   $FE5F,Y                        
35CD- 8A                   TXA                                  
35CE- 11 40                ORA   (A3L),Y                        
35D0- AA                   TAX                                  
35D1- 88                   DEY                                  
35D2- C0 07                CPY   #$07                           
35D4- D0 F2                BNE   L35C8                          
35D6- 8A                   TXA                                  
35D7- D0 0B                BNE   L35E4                          
35D9- A2 03                LDX   #$03                           
35DB- BD 90 BF  L35DB      LDA   $BF90,X                        
35DE- 9D 67 FE             STA   $FE67,X                        
35E1- CA                   DEX                                  
35E2- 10 F7                BPL   L35DB                          
35E4- B1 40     L35E4      LDA   (A3L),Y                        
35E6- C9 04                CMP   #$04                           
35E8- A9 10                LDA   #$10                           
35EA- 90 02                BCC   L35EE                          
35EC- A9 D0                LDA   #$D0                           
35EE- AE AA FE  L35EE      LDX   $FEAA                          
35F1- 1D 00 D7             ORA   $D700,X                        
35F4- 8D 4F FE             STA   $FE4F                          
35F7- 29 0F                AND   #$0F                           
35F9- A8                   TAY                                  
35FA- 18                   CLC                                  
35FB- 6D AA FE             ADC   $FEAA                          
35FE- AA                   TAX                                  
35FF- BD 00 D7  L35FF      LDA   $D700,X                        
3602- 99 4F FE             STA   $FE4F,Y                        
3605- CA                   DEX                                  
3606- 88                   DEY                                  
3607- D0 F6                BNE   L35FF                          
3609- A0 03                LDY   #$03                           
360B- B1 40                LDA   (A3L),Y                        
360D- 8D 6D FE             STA   $FE6D                          
3610- C8                   INY                                  
3611- B1 40                LDA   (A3L),Y                        
3613- 8D 5F FE             STA   $FE5F                          
3616- C8        L3616      INY                                  
3617- B1 40                LDA   (A3L),Y                        
3619- 99 69 FE             STA   $FE69,Y                        
361C- C0 06                CPY   #$06                           
361E- D0 F6                BNE   L3616                          
3620- AD F4 FD             LDA   $FDF4                          
3623- 8D 6B FE             STA   $FE6B                          
3626- AD F5 FD             LDA   $FDF5                          
3629- 8D 6C FE             STA   $FE6C                          
362C- A9 01                LDA   #$01                           
362E- 8D 62 FE             STA   $FE62                          
3631- AD 4A FE             LDA   $FE4A                          
3634- 8D 74 FE             STA   $FE74                          
3637- AD 4B FE             LDA   $FE4B                          
363A- 8D 75 FE             STA   $FE75                          
363D- AD 4F FE             LDA   $FE4F                          
3640- 29 E0                AND   #$E0                           
3642- F0 35                BEQ   L3679                          
3644- A2 1E                LDX   #$1E                           
3646- BD 4F FE  L3646      LDA   $FE4F,X                        
3649- 9D 04 DC             STA   $DC04,X                        
364C- CA                   DEX                                  
364D- 10 F7                BPL   L3646                          
364F- 49 30                EOR   #$30                           
3651- 8D 04 DC             STA   $DC04                          
3654- A2 07                LDX   #$07                           
3656- BD F1 FD  L3656      LDA   $FDF1,X                        
3659- 9D 14 DC             STA   $DC14,X                        
365C- BD F4 FD             LDA   $FDF4,X                        
365F- 9D 20 DC             STA   $DC20,X                        
3662- CA                   DEX                                  
3663- 10 F1                BPL   L3656                          
3665- A2 02                LDX   #$02                           
3667- 8E 65 FE             STX   $FE65                          
366A- BD 4C FE  L366A      LDA   $FE4C,X                        
366D- 9D 27 DC             STA   $DC27,X                        
3670- CA                   DEX                                  
3671- 10 F7                BPL   L366A                          
3673- AD 41 FE             LDA   $FE41                          
3676- 8D 2A DC             STA   $DC2A                          
3679- 20 A0 EA  L3679      JSR   $EAA0                          
367C- B0 37                BCS   L36B5                          
367E- 8D 60 FE             STA   $FE60                          
3681- 8C 61 FE             STY   $FE61                          
3684- 85 46                STA   $46                            
3686- 84 47                STY   $47                            
3688- 20 D9 EB             JSR   $EBD9                          
368B- B0 28                BCS   L36B5                          
368D- EE 43 FE             INC   $FE43                          
3690- D0 03                BNE   L3695                          
3692- EE 44 FE             INC   $FE44                          
3695- 20 B6 E4  L3695      JSR   $E4B6                          
3698- B0 1B                BCS   L36B5                          
369A- 4C 7A EB             JMP   $EB7A                          
369D- A9 DC                LDA   #$DC                           
369F- 85 49                STA   $49                            
36A1- A9 04                LDA   #$04                           
36A3- AE 4E FE             LDX   $FE4E                          
36A6- 18        L36A6      CLC                                  
36A7- CA        L36A7      DEX                                  
36A8- F0 09                BEQ   L36B3                          
36AA- 6D 41 FE             ADC   $FE41                          
36AD- 90 F8                BCC   L36A7                          
36AF- E6 49                INC   $49                            
36B1- B0 F3                BCS   L36A6                          
36B3- 85 48     L36B3      STA   $48                            
36B5- 60        L36B5      RTS                                  
36B6- AD 90 BF             LDA   $BF90                          
36B9- F0 0B                BEQ   L36C6                          
36BB- A2 03                LDX   #$03                           
36BD- BD 90 BF  L36BD      LDA   $BF90,X                        
36C0- 9D 70 FE             STA   $FE70,X                        
36C3- CA                   DEX                                  
36C4- 10 F7                BPL   L36BD                          
36C6- AD 6D FE  L36C6      LDA   $FE6D                          
36C9- 0D A4 FE             ORA   $FEA4                          
36CC- 8D 6D FE             STA   $FE6D                          
36CF- AD 49 FE             LDA   $FE49                          
36D2- 8D 30 BF             STA   $BF30                          
36D5- AD 4C FE             LDA   $FE4C                          
36D8- AE 4D FE             LDX   $FE4D                          
36DB- 20 CD EB             JSR   $EBCD                          
36DE- B0 D5                BCS   L36B5                          
36E0- 20 9D E4             JSR   $E49D                          
36E3- AC 41 FE             LDY   $FE41                          
36E6- 88                   DEY                                  
36E7- B9 4F FE  L36E7      LDA   $FE4F,Y                        
36EA- 91 48                STA   ($48),Y                        
36EC- 88                   DEY                                  
36ED- 10 F8                BPL   L36E7                          
36EF- AD 4A FE             LDA   $FE4A                          
36F2- C5 46                CMP   $46                            
36F4- D0 07                BNE   L36FD                          
36F6- AD 4B FE             LDA   $FE4B                          
36F9- C5 47                CMP   $47                            
36FB- F0 10                BEQ   L370D                          
36FD- 20 D9 EB  L36FD      JSR   $EBD9                          
3700- B0 B3                BCS   L36B5                          
3702- AD 4A FE             LDA   $FE4A                          
3705- AE 4B FE             LDX   $FE4B                          
3708- 20 CD EB             JSR   $EBCD                          
370B- B0 A8                BCS   L36B5                          
370D- A0 01     L370D      LDY   #$01                           
370F- B9 43 FE  L370F      LDA   $FE43,Y                        
3712- 99 25 DC             STA   $DC25,Y                        
3715- 88                   DEY                                  
3716- 10 F7                BPL   L370F                          
3718- AD 40 FE             LDA   $FE40                          
371B- 8D 22 DC             STA   $DC22                          
371E- 20 D9 EB             JSR   $EBD9                          
3721- B0 54                BCS   L3777                          
3723- AD 04 DC  L3723      LDA   $DC04                          
3726- 29 F0                AND   #$F0                           
3728- 49 F0                EOR   #$F0                           
372A- F0 69                BEQ   L3795                          
372C- AD 29 DC             LDA   $DC29                          
372F- 8D 4E FE             STA   $FE4E                          
3732- AD 2A DC             LDA   $DC2A                          
3735- 8D 41 FE             STA   $FE41                          
3738- AD 27 DC             LDA   $DC27                          
373B- AE 28 DC             LDX   $DC28                          
373E- 20 CD EB             JSR   $EBCD                          
3741- B0 34                BCS   L3777                          
3743- 20 9D E4             JSR   $E49D                          
3746- AD 90 BF             LDA   $BF90                          
3749- F0 0D                BEQ   L3758                          
374B- A2 03                LDX   #$03                           
374D- A0 24                LDY   #$24                           
374F- BD 90 BF  L374F      LDA   $BF90,X                        
3752- 91 48                STA   ($48),Y                        
3754- 88                   DEY                                  
3755- CA                   DEX                                  
3756- 10 F7                BPL   L374F                          
3758- 20 D9 EB  L3758      JSR   $EBD9                          
375B- B0 1A                BCS   L3777                          
375D- A0 25                LDY   #$25                           
375F- B1 48                LDA   ($48),Y                        
3761- C8                   INY                                  
3762- C5 46                CMP   $46                            
3764- 85 46                STA   $46                            
3766- D0 06                BNE   L376E                          
3768- B1 48                LDA   ($48),Y                        
376A- C5 47                CMP   $47                            
376C- F0 B5                BEQ   L3723                          
376E- B1 48     L376E      LDA   ($48),Y                        
3770- 85 47                STA   $47                            
3772- 20 DD EB             JSR   $EBDD                          
3775- 90 AC                BCC   L3723                          
3777- 60        L3777      RTS                                  
3778- A9 52     L3778      LDA   #$52                           
377A- 38                   SEC                                  
377B- 60                   RTS                                  
377C- AD 00 DC             LDA   $DC00                          
377F- CD F2 FD             CMP   $FDF2                          
3782- D0 F4                BNE   L3778                          
3784- AD 01 DC             LDA   $DC01                          
3787- CD F3 FD             CMP   $FDF3                          
378A- D0 EC                BNE   L3778                          
378C- AD 04 DC             LDA   $DC04                          
378F- 29 E0                AND   #$E0                           
3791- C9 E0                CMP   #$E0                           
3793- D0 E3                BNE   L3778                          
3795- 18        L3795      CLC                                  
3796- 60                   RTS                                  
3797- 20 AA E5             JSR   $E5AA                          
379A- B0 0D                BCS   L37A9                          
379C- AC 41 FE             LDY   $FE41                          
379F- B1 48     L379F      LDA   ($48),Y                        
37A1- 99 4F FE             STA   $FE4F,Y                        
37A4- 88                   DEY                                  
37A5- 10 F8                BPL   L379F                          
37A7- A9 00                LDA   #$00                           
37A9- 60        L37A9      RTS                                  
37AA- 20 27 E7             JSR   $E727                          
37AD- B0 51                BCS   L3800                          
37AF- D0 27                BNE   L37D8                          
37B1- A9 DC                LDA   #$DC                           
37B3- 85 49                STA   $49                            
37B5- A9 04                LDA   #$04                           
37B7- 85 48                STA   $48                            
37B9- A0 1F                LDY   #$1F                           
37BB- B1 48     L37BB      LDA   ($48),Y                        
37BD- 99 4F FE             STA   $FE4F,Y                        
37C0- 88                   DEY                                  
37C1- C0 17                CPY   #$17                           
37C3- D0 F6                BNE   L37BB                          
37C5- B9 EC FD  L37C5      LDA   $FDEC,Y                        
37C8- 99 4F FE             STA   $FE4F,Y                        
37CB- 88                   DEY                                  
37CC- C0 0F                CPY   #$0F                           
37CE- D0 F5                BNE   L37C5                          
37D0- A9 D0                LDA   #$D0                           
37D2- 8D 4F FE             STA   $FE4F                          
37D5- A9 40                LDA   #$40                           
37D7- 60                   RTS                                  
37D8- A9 00     L37D8      LDA   #$00                           
37DA- 8D 8B FE             STA   $FE8B                          
37DD- 38                   SEC                                  
37DE- A9 00     L37DE      LDA   #$00                           
37E0- 8D 87 FE             STA   $FE87                          
37E3- 20 D1 E6             JSR   $E6D1                          
37E6- 90 60                BCC   L3848                          
37E8- AD 88 FE             LDA   $FE88                          
37EB- ED 87 FE             SBC   $FE87                          
37EE- 90 09                BCC   L37F9                          
37F0- D0 10                BNE   L3802                          
37F2- CD 89 FE             CMP   $FE89                          
37F5- F0 25                BEQ   L381C                          
37F7- D0 09                BNE   L3802                          
37F9- CE 89 FE  L37F9      DEC   $FE89                          
37FC- 10 04                BPL   L3802                          
37FE- A9 51     L37FE      LDA   #$51                           
3800- 38        L3800      SEC                                  
3801- 60                   RTS                                  
3802- 8D 88 FE  L3802      STA   $FE88                          
3805- A9 DC                LDA   #$DC                           
3807- 85 49                STA   $49                            
3809- AD 02 DC             LDA   $DC02                          
380C- D0 05                BNE   L3813                          
380E- CD 03 DC             CMP   $DC03                          
3811- F0 EB                BEQ   L37FE                          
3813- AE 03 DC  L3813      LDX   $DC03                          
3816- 20 CD EB             JSR   $EBCD                          
3819- 90 C3                BCC   L37DE                          
381B- 60                   RTS                                  
381C- AD 8B FE  L381C      LDA   $FE8B                          
381F- D0 1B                BNE   L383C                          
3821- AD 02 DC             LDA   $DC02                          
3824- D0 05                BNE   L382B                          
3826- CD 03 DC             CMP   $DC03                          
3829- F0 11                BEQ   L383C                          
382B- 8D 4C FE  L382B      STA   $FE4C                          
382E- AD 03 DC             LDA   $DC03                          
3831- 8D 4D FE             STA   $FE4D                          
3834- A9 01                LDA   #$01                           
3836- 8D 4E FE             STA   $FE4E                          
3839- 8D 8B FE             STA   $FE8B                          
383C- 20 68 E7  L383C      JSR   $E768                          
383F- 38        L383F      SEC                                  
3840- F0 03                BEQ   L3845                          
3842- A9 44                LDA   #$44                           
3844- 60                   RTS                                  
3845- A9 46     L3845      LDA   #$46                           
3847- 60                   RTS                                  
3848- 20 61 E7  L3848      JSR   $E761                          
384B- F0 6C                BEQ   L38B9                          
384D- A0 00                LDY   #$00                           
384F- B1 48                LDA   ($48),Y                        
3851- 29 F0                AND   #$F0                           
3853- C9 D0                CMP   #$D0                           
3855- D0 E8                BNE   L383F                          
3857- A0 11                LDY   #$11                           
3859- B1 48                LDA   ($48),Y                        
385B- 85 46                STA   $46                            
385D- C8                   INY                                  
385E- 8D 4A FE             STA   $FE4A                          
3861- B1 48                LDA   ($48),Y                        
3863- 85 47                STA   $47                            
3865- 8D 4B FE             STA   $FE4B                          
3868- 20 DD EB             JSR   $EBDD                          
386B- B0 24                BCS   L3891                          
386D- AD 25 DC             LDA   $DC25                          
3870- 8D 88 FE             STA   $FE88                          
3873- AD 26 DC             LDA   $DC26                          
3876- 8D 89 FE             STA   $FE89                          
3879- AD 21 DC             LDA   $DC21                          
387C- EA                   NOP                                  
387D- EA                   NOP                                  
387E- AD 14 DC             LDA   $DC14                          
3881- A2 00                LDX   #$00                           
3883- 38                   SEC                                  
3884- 2A                   ROL                                  
3885- 90 01     L3885      BCC   L3888                          
3887- E8                   INX                                  
3888- 0A        L3888      ASL                                  
3889- D0 FA                BNE   L3885                          
388B- E0 05                CPX   #$05                           
388D- F0 04                BEQ   L3893                          
388F- A9 4A                LDA   #$4A                           
3891- 38        L3891      SEC                                  
3892- 60                   RTS                                  
3893- 20 99 E6  L3893      JSR   $E699                          
3896- 4C D8 E5             JMP   $E5D8                          
3899- A2 0A                LDX   #$0A                           
389B- BD 1C DC  L389B      LDA   $DC1C,X                        
389E- 9D 3A FE             STA   $FE3A,X                        
38A1- CA                   DEX                                  
38A2- 10 F7                BPL   L389B                          
38A4- AD 04 DC             LDA   $DC04                          
38A7- 29 F0                AND   #$F0                           
38A9- 49 F0                EOR   #$F0                           
38AB- F0 0B                BEQ   L38B8                          
38AD- A2 03                LDX   #$03                           
38AF- BD 27 DC  L38AF      LDA   $DC27,X                        
38B2- 9D 36 FE             STA   VERIFY,X                       
38B5- CA                   DEX                                  
38B6- 10 F7                BPL   L38AF                          
38B8- 60        L38B8      RTS                                  
38B9- AD 42 FE  L38B9      LDA   $FE42                          
38BC- 38                   SEC                                  
38BD- ED 8A FE             SBC   $FE8A                          
38C0- 69 00                ADC   #$00                           
38C2- 8D 4E FE             STA   $FE4E                          
38C5- A5 46                LDA   $46                            
38C7- 8D 4C FE             STA   $FE4C                          
38CA- A5 47                LDA   $47                            
38CC- 8D 4D FE             STA   $FE4D                          
38CF- 18                   CLC                                  
38D0- 60                   RTS                                  
38D1- AD 42 FE             LDA   $FE42                          
38D4- 8D 8A FE             STA   $FE8A                          
38D7- A9 DC                LDA   #$DC                           
38D9- 85 49                STA   $49                            
38DB- A9 04                LDA   #$04                           
38DD- 85 48     L38DD      STA   $48                            
38DF- B0 33                BCS   L3914                          
38E1- A0 00                LDY   #$00                           
38E3- B1 48                LDA   ($48),Y                        
38E5- D0 0D                BNE   L38F4                          
38E7- AD 8B FE             LDA   $FE8B                          
38EA- D0 28                BNE   L3914                          
38EC- 20 B9 E6             JSR   $E6B9                          
38EF- EE 8B FE             INC   $FE8B                          
38F2- D0 20                BNE   L3914                          
38F4- 29 0F     L38F4      AND   #$0F                           
38F6- EE 87 FE             INC   $FE87                          
38F9- 8D A8 FE             STA   $FEA8                          
38FC- AE AA FE             LDX   $FEAA                          
38FF- DD 00 D7             CMP   $D700,X                        
3902- D0 10                BNE   L3914                          
3904- E8        L3904      INX                                  
3905- C8                   INY                                  
3906- B1 48                LDA   ($48),Y                        
3908- DD 00 D7             CMP   $D700,X                        
390B- D0 07                BNE   L3914                          
390D- CE A8 FE             DEC   $FEA8                          
3910- D0 F2                BNE   L3904                          
3912- 18                   CLC                                  
3913- 60        L3913      RTS                                  
3914- CE 8A FE  L3914      DEC   $FE8A                          
3917- 38                   SEC                                  
3918- F0 F9                BEQ   L3913                          
391A- AD 41 FE             LDA   $FE41                          
391D- 18                   CLC                                  
391E- 65 48                ADC   $48                            
3920- 90 BB                BCC   L38DD                          
3922- E6 49                INC   $49                            
3924- 18                   CLC                                  
3925- 90 B6                BCC   L38DD                          
3927- 20 80 E7             JSR   $E780                          
392A- B0 53                BCS   L397F                          
392C- A9 00                LDA   #$00                           
392E- A0 42                LDY   #$42                           
3930- 99 36 FE  L3930      STA   VERIFY,Y                       
3933- 88                   DEY                                  
3934- 10 FA                BPL   L3930                          
3936- AD 30 BF             LDA   $BF30                          
3939- 8D 49 FE             STA   $FE49                          
393C- 20 99 E6             JSR   $E699                          
393F- A0 01                LDY   #$01                           
3941- AE 81 FE             LDX   $FE81                          
3944- E8                   INX                                  
3945- BD 12 D9  L3945      LDA   $D912,X                        
3948- 99 47 FE             STA   $FE47,Y                        
394B- BD 1A D9             LDA   $D91A,X                        
394E- 99 45 FE             STA   $FE45,Y                        
3951- B9 46 00             LDA   $0046,Y                        
3954- 99 4A FE             STA   $FE4A,Y                        
3957- B9 43 FE             LDA   $FE43,Y                        
395A- 99 88 FE             STA   $FE88,Y                        
395D- CA                   DEX                                  
395E- 88                   DEY                                  
395F- 10 E4                BPL   L3945                          
3961- 20 68 E7             JSR   $E768                          
3964- 8C AA FE             STY   $FEAA                          
3967- 60                   RTS                                  
3968- AC AA FE             LDY   $FEAA                          
396B- B9 00 D7             LDA   $D700,Y                        
396E- 38                   SEC                                  
396F- 6D AA FE             ADC   $FEAA                          
3972- A8                   TAY                                  
3973- D0 06                BNE   L397B                          
3975- AD 30 BF             LDA   $BF30                          
3978- 8D 8F FE             STA   $FE8F                          
397B- B9 00 D7  L397B      LDA   $D700,Y                        
397E- 18                   CLC                                  
397F- 60        L397F      RTS                                  
3980- A9 00                LDA   #$00                           
3982- AC 9A BF             LDY   $BF9A                          
3985- 2C AC FE             BIT   $FEAC                          
3988- 10 01                BPL   L398B                          
398A- A8                   TAY                                  
398B- 8C AB FE  L398B      STY   $FEAB                          
398E- 8D 30 BF             STA   $BF30                          
3991- 48        L3991      PHA                                  
3992- AA                   TAX                                  
3993- BD 00 D9             LDA   $D900,X                        
3996- D0 0B                BNE   L39A3                          
3998- AC AB FE  L3998      LDY   $FEAB                          
399B- 68                   PLA                                  
399C- 18                   CLC                                  
399D- 69 20                ADC   #$20                           
399F- 90 F0                BCC   L3991                          
39A1- B0 50                BCS   L39F3                          
39A3- 8D A8 FE  L39A3      STA   $FEA8                          
39A6- D9 00 D7  L39A6      CMP   $D700,Y                        
39A9- D0 ED                BNE   L3998                          
39AB- E8                   INX                                  
39AC- C8                   INY                                  
39AD- BD 00 D9             LDA   $D900,X                        
39B0- CE A8 FE             DEC   $FEA8                          
39B3- 10 F1                BPL   L39A6                          
39B5- 68                   PLA                                  
39B6- AA                   TAX                                  
39B7- 8D 81 FE             STA   $FE81                          
39BA- BD 10 D9             LDA   $D910,X                        
39BD- 8D 30 BF             STA   $BF30                          
39C0- A9 00                LDA   #$00                           
39C2- 85 47                STA   $47                            
39C4- A9 02                LDA   #$02                           
39C6- 85 46                STA   $46                            
39C8- AD AB FE             LDA   $FEAB                          
39CB- A8        L39CB      TAY                                  
39CC- 8D AA FE             STA   $FEAA                          
39CF- F0 10                BEQ   L39E1                          
39D1- 38                   SEC                                  
39D2- 79 00 D7             ADC   $D700,Y                        
39D5- 90 F4                BCC   L39CB                          
39D7- AD 90 FE             LDA   $FE90                          
39DA- 85 46                STA   $46                            
39DC- AD 91 FE             LDA   $FE91                          
39DF- 85 47                STA   $47                            
39E1- 20 DD EB  L39E1      JSR   $EBDD                          
39E4- B0 05                BCS   L39EB                          
39E6- 20 85 E8             JSR   $E885                          
39E9- 90 24                BCC   L3A0F                          
39EB- AE 81 FE  L39EB      LDX   $FE81                          
39EE- BD 11 D9             LDA   $D911,X                        
39F1- 30 19                BMI   L3A0C                          
39F3- AD AB FE  L39F3      LDA   $FEAB                          
39F6- 8D AA FE             STA   $FEAA                          
39F9- 20 4B E8             JSR   $E84B                          
39FC- AD 30 BF             LDA   $BF30                          
39FF- D0 0F                BNE   L3A10                          
3A01- AE 31 BF  L3A01      LDX   $BF31                          
3A04- BD BA FE  L3A04      LDA   $FEBA,X                        
3A07- D0 0A                BNE   L3A13                          
3A09- CA                   DEX                                  
3A0A- 10 F8                BPL   L3A04                          
3A0C- A9 45     L3A0C      LDA   #$45                           
3A0E- 38                   SEC                                  
3A0F- 60        L3A0F      RTS                                  
3A10- AE 31 BF  L3A10      LDX   $BF31                          
3A13- DD BA FE  L3A13      CMP   $FEBA,X                        
3A16- F0 05                BEQ   L3A1D                          
3A18- CA                   DEX                                  
3A19- 10 F8                BPL   L3A13                          
3A1B- 30 EF                BMI   L3A0C                          
3A1D- 8D 30 BF  L3A1D      STA   $BF30                          
3A20- A9 00                LDA   #$00                           
3A22- 9D BA FE             STA   $FEBA,X                        
3A25- 20 5D E8             JSR   $E85D                          
3A28- B0 20                BCS   L3A4A                          
3A2A- AE 81 FE             LDX   $FE81                          
3A2D- BD 00 D9             LDA   $D900,X                        
3A30- F0 05                BEQ   L3A37                          
3A32- BD 11 D9             LDA   $D911,X                        
3A35- 30 CA                BMI   L3A01                          
3A37- A9 02     L3A37      LDA   #$02                           
3A39- A2 00                LDX   #$00                           
3A3B- 20 CD EB             JSR   $EBCD                          
3A3E- B0 C1                BCS   L3A01                          
3A40- 20 AB E8             JSR   $E8AB                          
3A43- B0 BC                BCS   L3A01                          
3A45- 20 85 E8             JSR   $E885                          
3A48- B0 B7                BCS   L3A01                          
3A4A- 60        L3A4A      RTS                                  
3A4B- AE 31 BF             LDX   $BF31                          
3A4E- BD 32 BF  L3A4E      LDA   $BF32,X                        
3A51- 29 F0                AND   #$F0                           
3A53- 9D BA FE             STA   $FEBA,X                        
3A56- CA                   DEX                                  
3A57- 10 F5                BPL   L3A4E                          
3A59- AE 31 BF             LDX   $BF31                          
3A5C- 60                   RTS                                  
3A5D- A9 00                LDA   #$00                           
3A5F- A0 FF                LDY   #$FF                           
3A61- AA        L3A61      TAX                                  
3A62- BD 10 D9             LDA   $D910,X                        
3A65- CD 30 BF             CMP   $BF30                          
3A68- D0 05                BNE   L3A6F                          
3A6A- 8E 81 FE             STX   $FE81                          
3A6D- 18                   CLC                                  
3A6E- 60                   RTS                                  
3A6F- BD 00 D9  L3A6F      LDA   $D900,X                        
3A72- D0 04                BNE   L3A78                          
3A74- C8                   INY                                  
3A75- 8E 81 FE             STX   $FE81                          
3A78- 8A        L3A78      TXA                                  
3A79- 18                   CLC                                  
3A7A- 69 20                ADC   #$20                           
3A7C- D0 E3                BNE   L3A61                          
3A7E- 98                   TYA                                  
3A7F- 30 01                BMI   L3A82                          
3A81- 18                   CLC                                  
3A82- A9 55     L3A82      LDA   #$55                           
3A84- 60                   RTS                                  
3A85- A2 00                LDX   #$00                           
3A87- AC AA FE             LDY   $FEAA                          
3A8A- AD 04 DC             LDA   $DC04                          
3A8D- C9 E0                CMP   #$E0                           
3A8F- 90 07                BCC   L3A98                          
3A91- 29 0F                AND   #$0F                           
3A93- 8D A8 FE             STA   $FEA8                          
3A96- D0 05                BNE   L3A9D                          
3A98- 38        L3A98      SEC                                  
3A99- 60                   RTS                                  
3A9A- BD 04 DC  L3A9A      LDA   $DC04,X                        
3A9D- D9 00 D7  L3A9D      CMP   $D700,Y                        
3AA0- D0 F6                BNE   L3A98                          
3AA2- E8                   INX                                  
3AA3- C8                   INY                                  
3AA4- CE A8 FE             DEC   $FEA8                          
3AA7- 10 F1                BPL   L3A9A                          
3AA9- 18                   CLC                                  
3AAA- 60                   RTS                                  
3AAB- AE 81 FE             LDX   $FE81                          
3AAE- BD 00 D9             LDA   $D900,X                        
3AB1- F0 05                BEQ   L3AB8                          
3AB3- 20 10 E9             JSR   $E910                          
3AB6- 90 57                BCC   L3B0F                          
3AB8- A9 00     L3AB8      LDA   #$00                           
3ABA- A0 1F                LDY   #$1F                           
3ABC- 9D 00 D9  L3ABC      STA   $D900,X                        
3ABF- E8                   INX                                  
3AC0- 88                   DEY                                  
3AC1- 10 F9                BPL   L3ABC                          
3AC3- 20 7C E5             JSR   $E57C                          
3AC6- B0 47                BCS   L3B0F                          
3AC8- 20 34 E9             JSR   $E934                          
3ACB- B0 41                BCS   L3B0E                          
3ACD- AD 04 DC             LDA   $DC04                          
3AD0- 29 0F                AND   #$0F                           
3AD2- A8                   TAY                                  
3AD3- 48                   PHA                                  
3AD4- 0D 81 FE             ORA   $FE81                          
3AD7- AA                   TAX                                  
3AD8- B9 04 DC  L3AD8      LDA   $DC04,Y                        
3ADB- 9D 00 D9             STA   $D900,X                        
3ADE- CA                   DEX                                  
3ADF- 88                   DEY                                  
3AE0- D0 F6                BNE   L3AD8                          
3AE2- 68                   PLA                                  
3AE3- 9D 00 D9             STA   $D900,X                        
3AE6- AD 30 BF             LDA   $BF30                          
3AE9- 9D 10 D9             STA   $D910,X                        
3AEC- AD 29 DC             LDA   $DC29                          
3AEF- 9D 12 D9             STA   $D912,X                        
3AF2- AD 2A DC             LDA   $DC2A                          
3AF5- 9D 13 D9             STA   $D913,X                        
3AF8- A5 46                LDA   $46                            
3AFA- 9D 16 D9             STA   $D916,X                        
3AFD- A5 47                LDA   $47                            
3AFF- 9D 17 D9             STA   $D917,X                        
3B02- AD 27 DC             LDA   $DC27                          
3B05- 9D 1A D9             STA   $D91A,X                        
3B08- AD 28 DC             LDA   $DC28                          
3B0B- 9D 1B D9             STA   $D91B,X                        
3B0E- 18        L3B0E      CLC                                  
3B0F- 60        L3B0F      RTS                                  
3B10- AD 04 DC             LDA   $DC04                          
3B13- 29 0F                AND   #$0F                           
3B15- DD 00 D9             CMP   $D900,X                        
3B18- 8E 80 FE             STX   SETINV                         
3B1B- D0 0B                BNE   L3B28                          
3B1D- A8                   TAY                                  
3B1E- 0D 80 FE             ORA   SETINV                         
3B21- AA                   TAX                                  
3B22- B9 04 DC  L3B22      LDA   $DC04,Y                        
3B25- DD 00 D9             CMP   $D900,X                        
3B28- 38        L3B28      SEC                                  
3B29- D0 05                BNE   L3B30                          
3B2B- CA                   DEX                                  
3B2C- 88                   DEY                                  
3B2D- D0 F3                BNE   L3B22                          
3B2F- 18                   CLC                                  
3B30- AE 80 FE  L3B30      LDX   SETINV                         
3B33- 60                   RTS                                  
3B34- A9 00                LDA   #$00                           
3B36- AA        L3B36      TAX                                  
3B37- 20 10 E9             JSR   $E910                          
3B3A- B0 0F                BCS   L3B4B                          
3B3C- BD 11 D9             LDA   $D911,X                        
3B3F- 30 14                BMI   L3B55                          
3B41- A9 00                LDA   #$00                           
3B43- 9D 00 D9             STA   $D900,X                        
3B46- 9D 10 D9             STA   $D910,X                        
3B49- F0 08                BEQ   L3B53                          
3B4B- 8A        L3B4B      TXA                                  
3B4C- 18                   CLC                                  
3B4D- 29 E0                AND   #$E0                           
3B4F- 69 20                ADC   #$20                           
3B51- 90 E3                BCC   L3B36                          
3B53- 18        L3B53      CLC                                  
3B54- 60                   RTS                                  
3B55- 8D A5 FE  L3B55      STA   $FEA5                          
3B58- 8E A6 FE             STX   $FEA6                          
3B5B- 38                   SEC                                  
3B5C- 60                   RTS                                  
3B5D- AE 81 FE             LDX   $FE81                          
3B60- BD 15 D9             LDA   $D915,X                        
3B63- 1D 14 D9             ORA   $D914,X                        
3B66- D0 52                BNE   L3BBA                          
3B68- 20 0C EA             JSR   $EA0C                          
3B6B- 8D 8C FE             STA   $FE8C                          
3B6E- A9 00                LDA   #$00                           
3B70- 8D 76 FE             STA   $FE76                          
3B73- 8D 77 FE             STA   $FE77                          
3B76- A9 FF                LDA   #$FF                           
3B78- 8D 8B FE             STA   $FE8B                          
3B7B- 20 7A EB             JSR   $EB7A                          
3B7E- B0 4E                BCS   L3BCE                          
3B80- AE 81 FE             LDX   $FE81                          
3B83- BD 1A D9             LDA   $D91A,X                        
3B86- 85 46                STA   $46                            
3B88- BD 1B D9             LDA   $D91B,X                        
3B8B- 85 47                STA   $47                            
3B8D- 20 DD EB  L3B8D      JSR   $EBDD                          
3B90- B0 3C                BCS   L3BCE                          
3B92- 20 CF E9             JSR   $E9CF                          
3B95- CE 8C FE             DEC   $FE8C                          
3B98- 30 09                BMI   L3BA3                          
3B9A- E6 46                INC   $46                            
3B9C- D0 EF                BNE   L3B8D                          
3B9E- E6 47                INC   $47                            
3BA0- 4C 8D E9             JMP   $E98D                          
3BA3- AE 81 FE  L3BA3      LDX   $FE81                          
3BA6- AD 8B FE             LDA   $FE8B                          
3BA9- 30 20                BMI   L3BCB                          
3BAB- 9D 1C D9             STA   $D91C,X                        
3BAE- AD 77 FE             LDA   $FE77                          
3BB1- 9D 15 D9             STA   $D915,X                        
3BB4- AD 76 FE             LDA   $FE76                          
3BB7- 9D 14 D9             STA   $D914,X                        
3BBA- BD 14 D9  L3BBA      LDA   $D914,X                        
3BBD- 38                   SEC                                  
3BBE- ED 84 FE             SBC   SETNORM                        
3BC1- BD 15 D9             LDA   $D915,X                        
3BC4- ED 85 FE             SBC   $FE85                          
3BC7- 90 02                BCC   L3BCB                          
3BC9- 18                   CLC                                  
3BCA- 60                   RTS                                  
3BCB- A9 48     L3BCB      LDA   #$48                           
3BCD- 38                   SEC                                  
3BCE- 60        L3BCE      RTS                                  
3BCF- A0 00                LDY   #$00                           
3BD1- B9 00 DC  L3BD1      LDA   $DC00,Y                        
3BD4- F0 03                BEQ   L3BD9                          
3BD6- 20 FC E9             JSR   $E9FC                          
3BD9- B9 00 DD  L3BD9      LDA   $DD00,Y                        
3BDC- F0 03                BEQ   L3BE1                          
3BDE- 20 FC E9             JSR   $E9FC                          
3BE1- C8        L3BE1      INY                                  
3BE2- D0 ED                BNE   L3BD1                          
3BE4- 2C 8B FE             BIT   $FE8B                          
3BE7- 10 12                BPL   L3BFB                          
3BE9- AD 76 FE             LDA   $FE76                          
3BEC- 0D 77 FE             ORA   $FE77                          
3BEF- F0 0A                BEQ   L3BFB                          
3BF1- 20 0C EA             JSR   $EA0C                          
3BF4- 38                   SEC                                  
3BF5- ED 8C FE             SBC   $FE8C                          
3BF8- 8D 8B FE             STA   $FE8B                          
3BFB- 60        L3BFB      RTS                                  
3BFC- 0A        L3BFC      ASL                                  
3BFD- 90 08                BCC   L3C07                          
3BFF- EE 76 FE             INC   $FE76                          
3C02- D0 03                BNE   L3C07                          
3C04- EE 77 FE             INC   $FE77                          
3C07- 09 00     L3C07      ORA   #$00                           
3C09- D0 F1                BNE   L3BFC                          
3C0B- 60                   RTS                                  
3C0C- AE 81 FE             LDX   $FE81                          
3C0F- BC 13 D9             LDY   $D913,X                        
3C12- BD 12 D9             LDA   $D912,X                        
3C15- D0 01                BNE   L3C18                          
3C17- 88                   DEY                                  
3C18- 98        L3C18      TYA                                  
3C19- 4A                   LSR                                  
3C1A- 4A                   LSR                                  
3C1B- 4A                   LSR                                  
3C1C- 4A                   LSR                                  
3C1D- 60                   RTS                                  
3C1E- 8E 8C FE             STX   $FE8C                          
3C21- 48                   PHA                                  
3C22- AE 81 FE             LDX   $FE81                          
3C25- BD 13 D9             LDA   $D913,X                        
3C28- CD 8C FE             CMP   $FE8C                          
3C2B- 68                   PLA                                  
3C2C- 90 6E                BCC   L3C9C                          
3C2E- AA                   TAX                                  
3C2F- 29 07                AND   #$07                           
3C31- A8                   TAY                                  
3C32- B9 04 FE             LDA   $FE04,Y                        
3C35- 8D 8B FE             STA   $FE8B                          
3C38- 8A                   TXA                                  
3C39- 4E 8C FE             LSR   $FE8C                          
3C3C- 6A                   ROR                                  
3C3D- 4E 8C FE             LSR   $FE8C                          
3C40- 6A                   ROR                                  
3C41- 4E 8C FE             LSR   $FE8C                          
3C44- 6A                   ROR                                  
3C45- 8D 92 FE             STA   $FE92                          
3C48- 4E 8C FE             LSR   $FE8C                          
3C4B- 2E 94 FE             ROL   $FE94                          
3C4E- 20 47 EB             JSR   $EB47                          
3C51- B0 48                BCS   L3C9B                          
3C53- AD 99 FE             LDA   $FE99                          
3C56- CD 8C FE             CMP   $FE8C                          
3C59- F0 16                BEQ   L3C71                          
3C5B- 20 7A EB             JSR   $EB7A                          
3C5E- B0 3B                BCS   L3C9B                          
3C60- AD 8C FE             LDA   $FE8C                          
3C63- AE 81 FE             LDX   $FE81                          
3C66- 9D 1C D9             STA   $D91C,X                        
3C69- AD 96 FE             LDA   $FE96                          
3C6C- 20 8B EB             JSR   $EB8B                          
3C6F- B0 2A                BCS   L3C9B                          
3C71- AC 92 FE  L3C71      LDY   $FE92                          
3C74- 4E 94 FE             LSR   $FE94                          
3C77- AD 8B FE             LDA   $FE8B                          
3C7A- 90 08                BCC   L3C84                          
3C7C- 19 00 DB             ORA   $DB00,Y                        
3C7F- 99 00 DB             STA   $DB00,Y                        
3C82- B0 06                BCS   L3C8A                          
3C84- 19 00 DA  L3C84      ORA   $DA00,Y                        
3C87- 99 00 DA             STA   $DA00,Y                        
3C8A- A9 80     L3C8A      LDA   #$80                           
3C8C- 0D 95 FE             ORA   $FE95                          
3C8F- 8D 95 FE             STA   $FE95                          
3C92- EE B2 FE             INC   $FEB2                          
3C95- D0 03                BNE   L3C9A                          
3C97- EE B3 FE             INC   $FEB3                          
3C9A- 18        L3C9A      CLC                                  
3C9B- 60        L3C9B      RTS                                  
3C9C- A9 5A     L3C9C      LDA   #$5A                           
3C9E- 38                   SEC                                  
3C9F- 60                   RTS                                  
3CA0- 20 47 EB             JSR   $EB47                          
3CA3- B0 23                BCS   L3CC8                          
3CA5- A0 00     L3CA5      LDY   #$00                           
3CA7- 8C 94 FE             STY   $FE94                          
3CAA- B9 00 DA  L3CAA      LDA   $DA00,Y                        
3CAD- D0 1A                BNE   L3CC9                          
3CAF- C8                   INY                                  
3CB0- D0 F8                BNE   L3CAA                          
3CB2- EE 94 FE             INC   $FE94                          
3CB5- EE 93 FE             INC   $FE93                          
3CB8- B9 00 DB  L3CB8      LDA   $DB00,Y                        
3CBB- D0 0C                BNE   L3CC9                          
3CBD- C8                   INY                                  
3CBE- D0 F8                BNE   L3CB8                          
3CC0- EE 93 FE             INC   $FE93                          
3CC3- 20 2C EB             JSR   $EB2C                          
3CC6- 90 DD                BCC   L3CA5                          
3CC8- 60        L3CC8      RTS                                  
3CC9- 8C 92 FE  L3CC9      STY   $FE92                          
3CCC- AD 93 FE             LDA   $FE93                          
3CCF- 8D 77 FE             STA   $FE77                          
3CD2- 98                   TYA                                  
3CD3- 0A                   ASL                                  
3CD4- 2E 77 FE             ROL   $FE77                          
3CD7- 0A                   ASL                                  
3CD8- 2E 77 FE             ROL   $FE77                          
3CDB- 0A                   ASL                                  
3CDC- 2E 77 FE             ROL   $FE77                          
3CDF- AA                   TAX                                  
3CE0- 38                   SEC                                  
3CE1- AD 94 FE             LDA   $FE94                          
3CE4- F0 05                BEQ   L3CEB                          
3CE6- B9 00 DB             LDA   $DB00,Y                        
3CE9- B0 03                BCS   L3CEE                          
3CEB- B9 00 DA  L3CEB      LDA   $DA00,Y                        
3CEE- 2A        L3CEE      ROL                                  
3CEF- B0 03                BCS   L3CF4                          
3CF1- E8                   INX                                  
3CF2- D0 FA                BNE   L3CEE                          
3CF4- 4A        L3CF4      LSR                                  
3CF5- 90 FD                BCC   L3CF4                          
3CF7- 8E 76 FE             STX   $FE76                          
3CFA- AE 94 FE             LDX   $FE94                          
3CFD- D0 05                BNE   L3D04                          
3CFF- 99 00 DA             STA   $DA00,Y                        
3D02- F0 03                BEQ   L3D07                          
3D04- 99 00 DB  L3D04      STA   $DB00,Y                        
3D07- A9 80     L3D07      LDA   #$80                           
3D09- 0D 95 FE             ORA   $FE95                          
3D0C- 8D 95 FE             STA   $FE95                          
3D0F- AC 81 FE             LDY   $FE81                          
3D12- B9 14 D9             LDA   $D914,Y                        
3D15- E9 01                SBC   #$01                           
3D17- 99 14 D9             STA   $D914,Y                        
3D1A- B0 08                BCS   L3D24                          
3D1C- B9 15 D9             LDA   $D915,Y                        
3D1F- E9 00                SBC   #$00                           
3D21- 99 15 D9             STA   $D915,Y                        
3D24- 18        L3D24      CLC                                  
3D25- AD 76 FE             LDA   $FE76                          
3D28- AC 77 FE             LDY   $FE77                          
3D2B- 60                   RTS                                  
3D2C- AC 81 FE             LDY   $FE81                          
3D2F- B9 13 D9             LDA   $D913,Y                        
3D32- 4A                   LSR                                  
3D33- 4A                   LSR                                  
3D34- 4A                   LSR                                  
3D35- 4A                   LSR                                  
3D36- D9 1C D9             CMP   $D91C,Y                        
3D39- F0 3B                BEQ   L3D76                          
3D3B- B9 1C D9             LDA   $D91C,Y                        
3D3E- 18                   CLC                                  
3D3F- 69 01                ADC   #$01                           
3D41- 99 1C D9             STA   $D91C,Y                        
3D44- 20 7A EB             JSR   $EB7A                          
3D47- AC 81 FE             LDY   $FE81                          
3D4A- B9 10 D9             LDA   $D910,Y                        
3D4D- CD 96 FE             CMP   $FE96                          
3D50- F0 0E                BEQ   L3D60                          
3D52- 20 7A EB             JSR   $EB7A                          
3D55- B0 1E                BCS   L3D75                          
3D57- AC 81 FE             LDY   $FE81                          
3D5A- B9 10 D9             LDA   $D910,Y                        
3D5D- 8D 96 FE             STA   $FE96                          
3D60- AC 95 FE  L3D60      LDY   $FE95                          
3D63- 30 05                BMI   L3D6A                          
3D65- 20 8B EB             JSR   $EB8B                          
3D68- B0 0B                BCS   L3D75                          
3D6A- AC 81 FE  L3D6A      LDY   $FE81                          
3D6D- B9 1C D9             LDA   $D91C,Y                        
3D70- 0A                   ASL                                  
3D71- 8D 93 FE             STA   $FE93                          
3D74- 18                   CLC                                  
3D75- 60        L3D75      RTS                                  
3D76- A9 48     L3D76      LDA   #$48                           
3D78- 38                   SEC                                  
3D79- 60                   RTS                                  
3D7A- 18                   CLC                                  
3D7B- AD 95 FE             LDA   $FE95                          
3D7E- 10 F5                BPL   L3D75                          
3D80- 20 D5 EB             JSR   $EBD5                          
3D83- B0 F0                BCS   L3D75                          
3D85- A9 00                LDA   #$00                           
3D87- 8D 95 FE             STA   $FE95                          
3D8A- 60                   RTS                                  
3D8B- 8D 96 FE             STA   $FE96                          
3D8E- AC 81 FE             LDY   $FE81                          
3D91- B9 1C D9             LDA   $D91C,Y                        
3D94- 8D 99 FE             STA   $FE99                          
3D97- 18                   CLC                                  
3D98- 79 1A D9             ADC   $D91A,Y                        
3D9B- 8D 97 FE             STA   $FE97                          
3D9E- B9 1B D9             LDA   $D91B,Y                        
3DA1- 69 00                ADC   #$00                           
3DA3- 8D 98 FE             STA   $FE98                          
3DA6- A9 01                LDA   #$01                           
3DA8- 85 42     L3DA8      STA   A4L                            
3DAA- AD 30 BF             LDA   $BF30                          
3DAD- 48                   PHA                                  
3DAE- AD 96 FE             LDA   $FE96                          
3DB1- 8D 30 BF             STA   $BF30                          
3DB4- AD 97 FE             LDA   $FE97                          
3DB7- 85 46                STA   $46                            
3DB9- AD 98 FE             LDA   $FE98                          
3DBC- 85 47                STA   $47                            
3DBE- AD 86 EA             LDA   $EA86                          
3DC1- 20 E3 EB             JSR   $EBE3                          
3DC4- AA                   TAX                                  
3DC5- 68                   PLA                                  
3DC6- 8D 30 BF             STA   $BF30                          
3DC9- 90 01                BCC   L3DCC                          
3DCB- 8A                   TXA                                  
3DCC- 60        L3DCC      RTS                                  
3DCD- 85 46                STA   $46                            
3DCF- 86 47                STX   $47                            
3DD1- 20 DD EB             JSR   $EBDD                          
3DD4- 60                   RTS                                  
3DD5- A9 02                LDA   #$02                           
3DD7- D0 CF                BNE   L3DA8                          
3DD9- A9 02                LDA   #$02                           
3DDB- D0 02                BNE   L3DDF                          
3DDD- A9 01                LDA   #$01                           
3DDF- 85 42     L3DDF      STA   A4L                            
3DE1- A9 DC                LDA   #$DC                           
3DE3- 08                   PHP                                  
3DE4- 78                   SEI                                  
3DE5- 85 45                STA   A5H                            
3DE7- A9 00                LDA   #$00                           
3DE9- 85 44                STA   A5L                            
3DEB- 8D 0F BF             STA   $BF0F                          
3DEE- A9 FF                LDA   #$FF                           
3DF0- 8D A2 FE             STA   $FEA2                          
3DF3- AD 30 BF             LDA   $BF30                          
3DF6- 85 43                STA   A4H                            
3DF8- 20 E4 DE             JSR   $DEE4                          
3DFB- B0 03                BCS   L3E00                          
3DFD- 28                   PLP                                  
3DFE- 18                   CLC                                  
3DFF- 60                   RTS                                  
3E00- 28        L3E00      PLP                                  
3E01- 38                   SEC                                  
3E02- 60                   RTS                                  
3E03- AE 82 FE             LDX   $FE82                          
3E06- A0 02                LDY   #$02                           
3E08- BD 12 D8  L3E08      LDA   $D812,X                        
3E0B- 91 40                STA   (A3L),Y                        
3E0D- E8                   INX                                  
3E0E- C8                   INY                                  
3E0F- C0 05                CPY   #$05                           
3E11- D0 F5                BNE   L3E08                          
3E13- 18                   CLC                                  
3E14- 60                   RTS                                  
3E15- A9 4D     L3E15      LDA   #$4D                           
3E17- 38                   SEC                                  
3E18- 60                   RTS                                  
3E19- A0 04                LDY   #$04                           
3E1B- AE 82 FE             LDX   $FE82                          
3E1E- E8                   INX                                  
3E1F- E8                   INX                                  
3E20- 38                   SEC                                  
3E21- B1 40     L3E21      LDA   (A3L),Y                        
3E23- 99 98 FE             STA   $FE98,Y                        
3E26- 90 08                BCC   L3E30                          
3E28- DD 15 D8             CMP   $D815,X                        
3E2B- 90 03                BCC   L3E30                          
3E2D- D0 E6                BNE   L3E15                          
3E2F- CA                   DEX                                  
3E30- 88        L3E30      DEY                                  
3E31- 98                   TYA                                  
3E32- 49 01                EOR   #$01                           
3E34- D0 EB                BNE   L3E21                          
3E36- AC 82 FE             LDY   $FE82                          
3E39- B9 13 D8             LDA   $D813,Y                        
3E3C- 29 FE                AND   #$FE                           
3E3E- 8D 76 FE             STA   $FE76                          
3E41- AD 9B FE             LDA   $FE9B                          
3E44- 38                   SEC                                  
3E45- ED 76 FE             SBC   $FE76                          
3E48- 8D 76 FE             STA   $FE76                          
3E4B- 90 0F                BCC   L3E5C                          
3E4D- C9 02                CMP   #$02                           
3E4F- B0 0B                BCS   L3E5C                          
3E51- AD 9C FE             LDA   $FE9C                          
3E54- D9 14 D8             CMP   $D814,Y                        
3E57- D0 03                BNE   L3E5C                          
3E59- 4C 7D ED             JMP   $ED7D                          
3E5C- B9 07 D8  L3E5C      LDA   $D807,Y                        
3E5F- F0 07                BEQ   L3E68                          
3E61- C9 04                CMP   #$04                           
3E63- 90 0C                BCC   L3E71                          
3E65- 4C AF ED             JMP   $EDAF                          
3E68- A0 82     L3E68      LDY   #$82                           
3E6A- 99 00 D8             STA   $D800,Y                        
3E6D- A9 43                LDA   #$43                           
3E6F- 38                   SEC                                  
3E70- 60                   RTS                                  
3E71- B9 07 D8  L3E71      LDA   $D807,Y                        
3E74- 8D 86 FE             STA   $FE86                          
3E77- B9 08 D8             LDA   $D808,Y                        
3E7A- 29 40                AND   #$40                           
3E7C- F0 05                BEQ   L3E83                          
3E7E- 20 85 EE             JSR   $EE85                          
3E81- B0 69                BCS   L3EEC                          
3E83- AC 82 FE  L3E83      LDY   $FE82                          
3E86- B9 14 D8             LDA   $D814,Y                        
3E89- 29 FE                AND   #$FE                           
3E8B- 8D 76 FE             STA   $FE76                          
3E8E- AD 9C FE             LDA   $FE9C                          
3E91- 38                   SEC                                  
3E92- ED 76 FE             SBC   $FE76                          
3E95- 90 1E                BCC   L3EB5                          
3E97- C9 02                CMP   #$02                           
3E99- B0 1A                BCS   L3EB5                          
3E9B- AE 86 FE             LDX   $FE86                          
3E9E- CA                   DEX                                  
3E9F- D0 79                BNE   L3F1A                          
3EA1- AD 9B FE  L3EA1      LDA   $FE9B                          
3EA4- 4A                   LSR                                  
3EA5- 0D 9C FE             ORA   $FE9C                          
3EA8- D0 5E                BNE   L3F08                          
3EAA- B9 0C D8             LDA   $D80C,Y                        
3EAD- 85 46                STA   $46                            
3EAF- B9 0D D8             LDA   $D80D,Y                        
3EB2- 4C 73 ED             JMP   $ED73                          
3EB5- B9 08 D8  L3EB5      LDA   $D808,Y                        
3EB8- 29 80                AND   #$80                           
3EBA- F0 05                BEQ   L3EC1                          
3EBC- 20 99 EE             JSR   $EE99                          
3EBF- B0 2B                BCS   L3EEC                          
3EC1- AE 86 FE  L3EC1      LDX   $FE86                          
3EC4- E0 03                CPX   #$03                           
3EC6- F0 25                BEQ   L3EED                          
3EC8- AD 9C FE             LDA   $FE9C                          
3ECB- 4A                   LSR                                  
3ECC- 08                   PHP                                  
3ECD- A9 07                LDA   #$07                           
3ECF- 28                   PLP                                  
3ED0- D0 61                BNE   L3F33                          
3ED2- 20 A3 ED             JSR   $EDA3                          
3ED5- CA                   DEX                                  
3ED6- F0 C9                BEQ   L3EA1                          
3ED8- 20 2C EE             JSR   $EE2C                          
3EDB- B0 0F                BCS   L3EEC                          
3EDD- AC 82 FE             LDY   $FE82                          
3EE0- A5 46                LDA   $46                            
3EE2- 99 0E D8             STA   $D80E,Y                        
3EE5- A5 47                LDA   $47                            
3EE7- 99 0F D8             STA   $D80F,Y                        
3EEA- 90 2E                BCC   L3F1A                          
3EEC- 60        L3EEC      RTS                                  
3EED- 20 A3 ED  L3EED      JSR   $EDA3                          
3EF0- 20 2C EE             JSR   $EE2C                          
3EF3- B0 F7                BCS   L3EEC                          
3EF5- AD 9C FE             LDA   $FE9C                          
3EF8- 4A                   LSR                                  
3EF9- A8                   TAY                                  
3EFA- B1 48                LDA   ($48),Y                        
3EFC- E6 49                INC   $49                            
3EFE- D1 48                CMP   ($48),Y                        
3F00- D0 0B                BNE   L3F0D                          
3F02- C9 00                CMP   #$00                           
3F04- D0 07                BNE   L3F0D                          
3F06- C6 49                DEC   $49                            
3F08- A9 03     L3F08      LDA   #$03                           
3F0A- 4C 33 ED             JMP   $ED33                          
3F0D- 85 46     L3F0D      STA   $46                            
3F0F- B1 48                LDA   ($48),Y                        
3F11- 85 47                STA   $47                            
3F13- C6 49                DEC   $49                            
3F15- 20 0F EE             JSR   $EE0F                          
3F18- B0 D2                BCS   L3EEC                          
3F1A- AD 9C FE  L3F1A      LDA   $FE9C                          
3F1D- 4A                   LSR                                  
3F1E- AD 9B FE             LDA   $FE9B                          
3F21- 6A                   ROR                                  
3F22- A8                   TAY                                  
3F23- B1 48                LDA   ($48),Y                        
3F25- E6 49                INC   $49                            
3F27- D1 48                CMP   ($48),Y                        
3F29- D0 42                BNE   L3F6D                          
3F2B- C9 00                CMP   #$00                           
3F2D- D0 3E                BNE   L3F6D                          
3F2F- A9 01                LDA   #$01                           
3F31- C6 49                DEC   $49                            
3F33- AC 82 FE  L3F33      LDY   $FE82                          
3F36- 19 08 D8             ORA   $D808,Y                        
3F39- 99 08 D8             STA   $D808,Y                        
3F3C- 4A                   LSR                                  
3F3D- 4A                   LSR                                  
3F3E- 20 5B ED             JSR   $ED5B                          
3F41- 90 3A                BCC   L3F7D                          
3F43- 20 49 ED             JSR   $ED49                          
3F46- 4C 7D ED             JMP   $ED7D                          
3F49- A9 00                LDA   #$00                           
3F4B- A8                   TAY                                  
3F4C- 91 48     L3F4C      STA   ($48),Y                        
3F4E- C8                   INY                                  
3F4F- D0 FB                BNE   L3F4C                          
3F51- E6 49                INC   $49                            
3F53- 91 48     L3F53      STA   ($48),Y                        
3F55- C8                   INY                                  
3F56- D0 FB                BNE   L3F53                          
3F58- C6 49                DEC   $49                            
3F5A- 60                   RTS                                  
3F5B- A9 00                LDA   #$00                           
3F5D- A8                   TAY                                  
3F5E- 91 4A     L3F5E      STA   ($4A),Y                        
3F60- C8                   INY                                  
3F61- D0 FB                BNE   L3F5E                          
3F63- E6 4B                INC   $4B                            
3F65- 91 4A     L3F65      STA   ($4A),Y                        
3F67- C8                   INY                                  
3F68- D0 FB                BNE   L3F65                          
3F6A- C6 4B                DEC   $4B                            
3F6C- 60                   RTS                                  
3F6D- 85 46     L3F6D      STA   $46                            
3F6F- B1 48                LDA   ($48),Y                        
3F71- C6 49                DEC   $49                            
3F73- 85 47                STA   $47                            
3F75- 20 F6 ED             JSR   $EDF6                          
3F78- B0 28                BCS   L3FA2                          
3F7A- 20 A3 ED             JSR   $EDA3                          
3F7D- AC 82 FE  L3F7D      LDY   $FE82                          
3F80- C8                   INY                                  
3F81- C8                   INY                                  
3F82- A2 02                LDX   #$02                           
3F84- B9 12 D8  L3F84      LDA   $D812,Y                        
3F87- 9D 7D FE             STA   $FE7D,X                        
3F8A- BD 9A FE             LDA   $FE9A,X                        
3F8D- 99 12 D8             STA   $D812,Y                        
3F90- 88                   DEY                                  
3F91- CA                   DEX                                  
3F92- 10 F0                BPL   L3F84                          
3F94- 18                   CLC                                  
3F95- A5 4A                LDA   $4A                            
3F97- 85 4C                STA   $4C                            
3F99- AD 9B FE             LDA   $FE9B                          
3F9C- 29 01                AND   #$01                           
3F9E- 65 4B                ADC   $4B                            
3FA0- 85 4D                STA   $4D                            
3FA2- 60        L3FA2      RTS                                  
3FA3- AC 82 FE             LDY   $FE82                          
3FA6- B9 08 D8             LDA   $D808,Y                        
3FA9- 29 F8                AND   #$F8                           
3FAB- 99 08 D8             STA   $D808,Y                        
3FAE- 60                   RTS                                  
3FAF- C9 0D                CMP   #$0D                           
3FB1- F0 05                BEQ   L3FB8                          
3FB3- A9 4A                LDA   #$4A                           
3FB5- 20 09 BF             JSR   $BF09                          
3FB8- AD 76 FE  L3FB8      LDA   $FE76                          
3FBB- 4A                   LSR                                  
3FBC- 8D 8A FE             STA   $FE8A                          
3FBF- B9 13 D8             LDA   $D813,Y                        
3FC2- CD 9B FE             CMP   $FE9B                          
3FC5- 90 0E                BCC   L3FD5                          
3FC7- A0 00     L3FC7      LDY   #$00                           
3FC9- 20 E3 ED             JSR   $EDE3                          
3FCC- B0 24                BCS   L3FF2                          
3FCE- EE 8A FE             INC   $FE8A                          
3FD1- 10 F4                BPL   L3FC7                          
3FD3- 30 A8                BMI   L3F7D                          
3FD5- A0 02     L3FD5      LDY   #$02                           
3FD7- 20 E3 ED             JSR   $EDE3                          
3FDA- B0 16                BCS   L3FF2                          
3FDC- CE 8A FE             DEC   $FE8A                          
3FDF- D0 F4                BNE   L3FD5                          
3FE1- F0 9A                BEQ   L3F7D                          
3FE3- B1 4A                LDA   ($4A),Y                        
3FE5- 85 46                STA   $46                            
3FE7- C9 01                CMP   #$01                           
3FE9- C8                   INY                                  
3FEA- B1 4A                LDA   ($4A),Y                        
3FEC- D0 06                BNE   L3FF4                          
3FEE- B0 04                BCS   L3FF4                          
3FF0- A9 4C                LDA   #$4C                           
3FF2- 38        L3FF2      SEC                                  
3FF3- 60                   RTS                                  
3FF4- 85 47     L3FF4      STA   $47                            
3FF6- A9 01                LDA   #$01                           
3FF8- 85 42                STA   A4L                            
3FFA- A2 4A                LDX   #$4A                           
3FFC- 20 52 EE             JSR   $EE52                          
3FFF- B0 0D                BCS   L400E                          
4001- AC 82 FE             LDY   $FE82                          
4004- A5 46                LDA   $46                            
4006- 99 10 D8             STA   $D810,Y                        
4009- A5 47                LDA   $47                            
400B- 99 11 D8             STA   $D811,Y                        
400E- 60        L400E      RTS                                  
400F- A9 01                LDA   #$01                           
4011- 85 42                STA   A4L                            
4013- A2 48                LDX   #$48                           
4015- 20 52 EE             JSR   $EE52                          
4018- B0 0E                BCS   L4028                          
401A- AC 82 FE             LDY   $FE82                          
401D- A5 46                LDA   $46                            
401F- 99 0E D8             STA   $D80E,Y                        
4022- A5 47                LDA   $47                            
4024- 99 0F D8             STA   $D80F,Y                        
4027- 18                   CLC                                  
4028- 60        L4028      RTS                                  
4029- A9 02                LDA   #$02                           
402B- 2C A9 01             BIT   $01A9                          
402E- 48                   PHA                                  
402F- A9 0C                LDA   #$0C                           
4031- 0D 82 FE             ORA   $FE82                          
4034- A8                   TAY                                  
4035- 68                   PLA                                  
4036- A2 48                LDX   #$48                           
4038- 85 42                STA   A4L                            
403A- B9 00 D8             LDA   $D800,Y                        
403D- 85 46                STA   $46                            
403F- D9 01 D8             CMP   $D801,Y                        
4042- D0 09                BNE   L404D                          
4044- C9 00                CMP   #$00                           
4046- D0 05                BNE   L404D                          
4048- A9 0C                LDA   #$0C                           
404A- 20 0C BF             JSR   $BF0C                          
404D- B9 01 D8  L404D      LDA   $D801,Y                        
4050- 85 47                STA   $47                            
4052- 08                   PHP                                  
4053- 78                   SEI                                  
4054- B5 00                LDA   $00,X                          
4056- 85 44                STA   A5L                            
4058- B5 01                LDA   $01,X                          
405A- 85 45                STA   A5H                            
405C- AC 82 FE             LDY   $FE82                          
405F- B9 01 D8             LDA   $D801,Y                        
4062- 8D 30 BF             STA   $BF30                          
4065- A9 FF                LDA   #$FF                           
4067- 8D A2 FE             STA   $FEA2                          
406A- AD 30 BF             LDA   $BF30                          
406D- 85 43                STA   A4H                            
406F- A9 00                LDA   #$00                           
4071- 8D 0F BF             STA   $BF0F                          
4074- 20 E4 DE             JSR   $DEE4                          
4077- B0 03                BCS   L407C                          
4079- 28                   PLP                                  
407A- 18                   CLC                                  
407B- 60                   RTS                                  
407C- 28        L407C      PLP                                  
407D- 38                   SEC                                  
407E- 60                   RTS                                  
407F- 20 7A EB             JSR   $EB7A                          
4082- 4C 29 EE             JMP   $EE29                          
4085- A2 4A                LDX   #$4A                           
4087- A9 10                LDA   #$10                           
4089- 0D 82 FE             ORA   $FE82                          
408C- A8                   TAY                                  
408D- A9 02                LDA   #$02                           
408F- 20 38 EE             JSR   $EE38                          
4092- B0 22                BCS   L40B6                          
4094- A9 BF                LDA   #$BF                           
4096- 4C AD EE             JMP   $EEAD                          
4099- 20 7A EB             JSR   $EB7A                          
409C- A2 48                LDX   #$48                           
409E- A9 0E                LDA   #$0E                           
40A0- 0D 82 FE             ORA   $FE82                          
40A3- A8                   TAY                                  
40A4- A9 02                LDA   #$02                           
40A6- 20 38 EE             JSR   $EE38                          
40A9- B0 0B                BCS   L40B6                          
40AB- A9 7F                LDA   #$7F                           
40AD- AC 82 FE             LDY   $FE82                          
40B0- 39 08 D8             AND   $D808,Y                        
40B3- 99 08 D8             STA   $D808,Y                        
40B6- 60        L40B6      RTS                                  
40B7- 20 97 E5             JSR   $E597                          
40BA- 90 04                BCC   L40C0                          
40BC- C9 40                CMP   #$40                           
40BE- D0 07                BNE   L40C7                          
40C0- 20 9D EF  L40C0      JSR   $EF9D                          
40C3- 90 08                BCC   L40CD                          
40C5- A9 50     L40C5      LDA   #$50                           
40C7- 38        L40C7      SEC                                  
40C8- 60                   RTS                                  
40C9- A9 4B     L40C9      LDA   #$4B                           
40CB- 38                   SEC                                  
40CC- 60                   RTS                                  
40CD- AC 82 FE  L40CD      LDY   $FE82                          
40D0- AD 83 FE             LDA   $FE83                          
40D3- D0 04                BNE   L40D9                          
40D5- A9 42                LDA   #$42                           
40D7- 38                   SEC                                  
40D8- 60                   RTS                                  
40D9- A2 1F     L40D9      LDX   #$1F                           
40DB- A9 00                LDA   #$00                           
40DD- 99 00 D8  L40DD      STA   $D800,Y                        
40E0- C8                   INY                                  
40E1- CA                   DEX                                  
40E2- 10 F9                BPL   L40DD                          
40E4- A9 06                LDA   #$06                           
40E6- AA                   TAX                                  
40E7- 0D 82 FE             ORA   $FE82                          
40EA- A8                   TAY                                  
40EB- BD 48 FE  L40EB      LDA   $FE48,X                        
40EE- 99 00 D8             STA   $D800,Y                        
40F1- 88                   DEY                                  
40F2- CA                   DEX                                  
40F3- D0 F6                BNE   L40EB                          
40F5- AD 4F FE             LDA   $FE4F                          
40F8- 4A                   LSR                                  
40F9- 4A                   LSR                                  
40FA- 4A                   LSR                                  
40FB- 4A                   LSR                                  
40FC- AA                   TAX                                  
40FD- 99 07 D8             STA   $D807,Y                        
4100- AD 6D FE             LDA   $FE6D                          
4103- 29 03                AND   #$03                           
4105- E0 0D                CPX   #$0D                           
4107- D0 02                BNE   L410B                          
4109- 29 01                AND   #$01                           
410B- 99 09 D8  L410B      STA   $D809,Y                        
410E- 29 02                AND   #$02                           
4110- F0 05                BEQ   L4117                          
4112- AD 87 FE             LDA   $FE87                          
4115- D0 AE                BNE   L40C5                          
4117- E0 04     L4117      CPX   #$04                           
4119- 90 04                BCC   L411F                          
411B- E0 0D                CPX   #$0D                           
411D- D0 AA                BNE   L40C9                          
411F- A2 06     L411F      LDX   #$06                           
4121- 85 47     L4121      STA   $47                            
4123- AD 82 FE             LDA   $FE82                          
4126- 1D 0C FE             ORA   $FE0C,X                        
4129- A8                   TAY                                  
412A- BD 60 FE             LDA   $FE60,X                        
412D- 99 00 D8             STA   $D800,Y                        
4130- CA                   DEX                                  
4131- 10 EE                BPL   L4121                          
4133- 85 46                STA   $46                            
4135- AC 82 FE             LDY   $FE82                          
4138- AD 8A FE             LDA   $FE8A                          
413B- 99 00 D8             STA   $D800,Y                        
413E- 20 F4 FB             JSR   $FBF4                          
4141- B0 24                BCS   L4167                          
4143- 20 E6 E1             JSR   $E1E6                          
4146- AD 94 BF             LDA   $BF94                          
4149- 99 1B D8             STA   $D81B,Y                        
414C- B9 07 D8             LDA   $D807,Y                        
414F- C9 04                CMP   #$04                           
4151- B0 2B                BCS   L417E                          
4153- A9 FF                LDA   #$FF                           
4155- 99 14 D8             STA   $D814,Y                        
4158- A0 02                LDY   #$02                           
415A- A9 00                LDA   #$00                           
415C- 99 9A FE  L415C      STA   $FE9A,Y                        
415F- 88                   DEY                                  
4160- 10 FA                BPL   L415C                          
4162- 20 36 EC             JSR   $EC36                          
4165- 90 1C                BCC   L4183                          
4167- 48        L4167      PHA                                  
4168- AC 82 FE             LDY   $FE82                          
416B- B9 0B D8             LDA   $D80B,Y                        
416E- F0 06                BEQ   L4176                          
4170- 20 51 FC             JSR   $FC51                          
4173- AC 82 FE             LDY   $FE82                          
4176- A9 00     L4176      LDA   #$00                           
4178- 99 00 D8             STA   $D800,Y                        
417B- 68                   PLA                                  
417C- 38                   SEC                                  
417D- 60                   RTS                                  
417E- 20 F6 ED  L417E      JSR   $EDF6                          
4181- B0 E4                BCS   L4167                          
4183- AE 81 FE  L4183      LDX   $FE81                          
4186- FE 1E D9             INC   $D91E,X                        
4189- BD 11 D9             LDA   $D911,X                        
418C- 09 80                ORA   #$80                           
418E- 9D 11 D9             STA   $D911,X                        
4191- AC 82 FE             LDY   $FE82                          
4194- B9 00 D8             LDA   $D800,Y                        
4197- A0 05                LDY   #$05                           
4199- 91 40                STA   (A3L),Y                        
419B- 18                   CLC                                  
419C- 60                   RTS                                  
419D- A9 00                LDA   #$00                           
419F- 8D 8A FE             STA   $FE8A                          
41A2- 8D 87 FE             STA   $FE87                          
41A5- 8D 83 FE             STA   $FE83                          
41A8- A8        L41A8      TAY                                  
41A9- AE 83 FE             LDX   $FE83                          
41AC- D0 03                BNE   L41B1                          
41AE- EE 8A FE             INC   $FE8A                          
41B1- B9 00 D8  L41B1      LDA   $D800,Y                        
41B4- D0 0D                BNE   L41C3                          
41B6- 8A                   TXA                                  
41B7- D0 28                BNE   L41E1                          
41B9- 8C 82 FE             STY   $FE82                          
41BC- A9 FF                LDA   #$FF                           
41BE- 8D 83 FE             STA   $FE83                          
41C1- D0 1E                BNE   L41E1                          
41C3- 98        L41C3      TYA                                  
41C4- 09 06                ORA   #$06                           
41C6- A8                   TAY                                  
41C7- A2 06                LDX   #$06                           
41C9- B9 00 D8  L41C9      LDA   $D800,Y                        
41CC- DD 48 FE             CMP   $FE48,X                        
41CF- D0 10                BNE   L41E1                          
41D1- 88                   DEY                                  
41D2- CA                   DEX                                  
41D3- D0 F4                BNE   L41C9                          
41D5- EE 87 FE             INC   $FE87                          
41D8- B9 09 D8             LDA   $D809,Y                        
41DB- 29 02                AND   #$02                           
41DD- F0 02                BEQ   L41E1                          
41DF- 38                   SEC                                  
41E0- 60                   RTS                                  
41E1- 98        L41E1      TYA                                  
41E2- 29 E0                AND   #$E0                           
41E4- 18                   CLC                                  
41E5- 69 20                ADC   #$20                           
41E7- D0 BF                BNE   L41A8                          
41E9- 18                   CLC                                  
41EA- 60                   RTS                                  
41EB- 20 F7 F1             JSR   $F1F7                          
41EE- 20 DC F1             JSR   $F1DC                          
41F1- 48                   PHA                                  
41F2- 20 09 F2             JSR   $F209                          
41F5- 68                   PLA                                  
41F6- 29 01                AND   #$01                           
41F8- D0 04                BNE   L41FE                          
41FA- A9 4E                LDA   #$4E                           
41FC- D0 24                BNE   L4222                          
41FE- 90 25     L41FE      BCC   L4225                          
4200- AC 82 FE             LDY   $FE82                          
4203- B9 15 D8             LDA   $D815,Y                        
4206- ED 9A FE             SBC   $FE9A                          
4209- 8D CA FE             STA   $FECA                          
420C- 8D 9D FE             STA   $FE9D                          
420F- B9 16 D8             LDA   $D816,Y                        
4212- ED 9B FE             SBC   $FE9B                          
4215- 8D CB FE             STA   $FECB                          
4218- 8D 9E FE             STA   $FE9E                          
421B- 0D CA FE             ORA   $FECA                          
421E- D0 10                BNE   L4230                          
4220- A9 4C                LDA   #$4C                           
4222- 4C DC F0  L4222      JMP   $F0DC                          
4225- AD CA FE  L4225      LDA   $FECA                          
4228- 0D CB FE             ORA   $FECB                          
422B- D0 03                BNE   L4230                          
422D- 4C E3 F0  L422D      JMP   $F0E3                          
4230- 20 89 FC  L4230      JSR   $FC89                          
4233- B0 ED                BCS   L4222                          
4235- 20 02 F2             JSR   $F202                          
4238- C9 04                CMP   #$04                           
423A- 90 03                BCC   L423F                          
423C- 4C A5 F1             JMP   $F1A5                          
423F- 20 36 EC  L423F      JSR   $EC36                          
4242- B0 DE                BCS   L4222                          
4244- 20 FA F0             JSR   $F0FA                          
4247- 20 24 F1             JSR   $F124                          
424A- 70 E1                BVS   L422D                          
424C- B0 F1                BCS   L423F                          
424E- AD 9E FE             LDA   $FE9E                          
4251- 4A                   LSR                                  
4252- F0 EB                BEQ   L423F                          
4254- 8D 9F FE             STA   $FE9F                          
4257- 20 E9 F5             JSR   $F5E9                          
425A- 29 40                AND   #$40                           
425C- D0 E1                BNE   L423F                          
425E- 8D A2 FE             STA   $FEA2                          
4261- A5 4E                LDA   RNDL                           
4263- 85 4A                STA   $4A                            
4265- A5 4F                LDA   RNDH                           
4267- 85 4B                STA   $4B                            
4269- 20 36 EC  L4269      JSR   $EC36                          
426C- B0 69                BCS   L42D7                          
426E- E6 4B     L426E      INC   $4B                            
4270- E6 4B                INC   $4B                            
4272- CE 9E FE             DEC   $FE9E                          
4275- CE 9E FE             DEC   $FE9E                          
4278- EE 9B FE             INC   $FE9B                          
427B- EE 9B FE             INC   $FE9B                          
427E- D0 09                BNE   L4289                          
4280- EE 9C FE             INC   $FE9C                          
4283- AD 9C FE             LDA   $FE9C                          
4286- 49 01                EOR   #$01                           
4288- 4A                   LSR                                  
4289- CE 9F FE  L4289      DEC   $FE9F                          
428C- D0 0D                BNE   L429B                          
428E- 20 97 F1             JSR   $F197                          
4291- AD 9D FE             LDA   $FE9D                          
4294- 0D 9E FE             ORA   $FE9E                          
4297- F0 4A                BEQ   L42E3                          
4299- D0 A4                BNE   L423F                          
429B- B0 CC     L429B      BCS   L4269                          
429D- AD 9C FE             LDA   $FE9C                          
42A0- 4A                   LSR                                  
42A1- AD 9B FE             LDA   $FE9B                          
42A4- 6A                   ROR                                  
42A5- A8                   TAY                                  
42A6- B1 48                LDA   ($48),Y                        
42A8- 85 46                STA   $46                            
42AA- E6 49                INC   $49                            
42AC- D1 48                CMP   ($48),Y                        
42AE- D0 09                BNE   L42B9                          
42B0- C9 00                CMP   #$00                           
42B2- D0 05                BNE   L42B9                          
42B4- 8D A2 FE             STA   $FEA2                          
42B7- F0 03                BEQ   L42BC                          
42B9- B1 48     L42B9      LDA   ($48),Y                        
42BB- 18                   CLC                                  
42BC- C6 49     L42BC      DEC   $49                            
42BE- B0 A9                BCS   L4269                          
42C0- 85 47                STA   $47                            
42C2- AD A2 FE             LDA   $FEA2                          
42C5- F0 A2                BEQ   L4269                          
42C7- 18                   CLC                                  
42C8- 08                   PHP                                  
42C9- 78                   SEI                                  
42CA- A5 4B                LDA   $4B                            
42CC- 85 45                STA   A5H                            
42CE- 20 E4 DE             JSR   $DEE4                          
42D1- B0 03                BCS   L42D6                          
42D3- 28                   PLP                                  
42D4- 90 98                BCC   L426E                          
42D6- 28        L42D6      PLP                                  
42D7- 48        L42D7      PHA                                  
42D8- 20 97 F1             JSR   $F197                          
42DB- 68                   PLA                                  
42DC- 48                   PHA                                  
42DD- 20 E3 F0             JSR   $F0E3                          
42E0- 68                   PLA                                  
42E1- 38                   SEC                                  
42E2- 60                   RTS                                  
42E3- A0 06     L42E3      LDY   #$06                           
42E5- 38                   SEC                                  
42E6- AD CA FE             LDA   $FECA                          
42E9- ED 9D FE             SBC   $FE9D                          
42EC- 91 40                STA   (A3L),Y                        
42EE- C8                   INY                                  
42EF- AD CB FE             LDA   $FECB                          
42F2- ED 9E FE             SBC   $FE9E                          
42F5- 91 40                STA   (A3L),Y                        
42F7- 4C 36 EC             JMP   $EC36                          
42FA- AC 82 FE             LDY   $FE82                          
42FD- 38                   SEC                                  
42FE- A5 4E                LDA   RNDL                           
4300- ED 9A FE             SBC   $FE9A                          
4303- 85 4E                STA   RNDL                           
4305- B0 02                BCS   L4309                          
4307- C6 4F                DEC   RNDH                           
4309- B9 1F D8  L4309      LDA   $D81F,Y                        
430C- 18                   CLC                                  
430D- F0 0A                BEQ   L4319                          
430F- 38                   SEC                                  
4310- 8D A1 FE             STA   $FEA1                          
4313- B9 0A D8             LDA   $D80A,Y                        
4316- 8D A0 FE             STA   $FEA0                          
4319- AC 9A FE  L4319      LDY   $FE9A                          
431C- A5 4A                LDA   $4A                            
431E- 85 4C                STA   $4C                            
4320- AE 9D FE             LDX   $FE9D                          
4323- 60                   RTS                                  
4324- 8A                   TXA                                  
4325- D0 08                BNE   L432F                          
4327- AD 9E FE             LDA   $FE9E                          
432A- F0 52                BEQ   L437E                          
432C- CE 9E FE             DEC   $FE9E                          
432F- CA        L432F      DEX                                  
4330- B1 4C     L4330      LDA   ($4C),Y                        
4332- 91 4E                STA   (RNDL),Y                       
4334- B0 31                BCS   L4367                          
4336- 8A        L4336      TXA                                  
4337- F0 19                BEQ   L4352                          
4339- CA                   DEX                                  
433A- C8                   INY                                  
433B- D0 F3                BNE   L4330                          
433D- A5 4D                LDA   $4D                            
433F- E6 4F                INC   RNDH                           
4341- EE 9B FE             INC   $FE9B                          
4344- D0 03                BNE   L4349                          
4346- EE 9C FE             INC   $FE9C                          
4349- E6 4D     L4349      INC   $4D                            
434B- 45 4B                EOR   $4B                            
434D- F0 E1                BEQ   L4330                          
434F- B8                   CLV                                  
4350- 50 2F                BVC   L4381                          
4352- AD 9E FE  L4352      LDA   $FE9E                          
4355- F0 1A                BEQ   L4371                          
4357- C8                   INY                                  
4358- D0 06                BNE   L4360                          
435A- A5 4D                LDA   $4D                            
435C- 45 4B                EOR   $4B                            
435E- D0 03                BNE   L4363                          
4360- CE 9E FE  L4360      DEC   $FE9E                          
4363- 88        L4363      DEY                                  
4364- 4C 39 F1             JMP   $F139                          
4367- B1 4C     L4367      LDA   ($4C),Y                        
4369- 2D A1 FE             AND   $FEA1                          
436C- 4D A0 FE             EOR   $FEA0                          
436F- D0 C5                BNE   L4336                          
4371- C8        L4371      INY                                  
4372- D0 0A                BNE   L437E                          
4374- E6 4F                INC   RNDH                           
4376- EE 9B FE             INC   $FE9B                          
4379- D0 03                BNE   L437E                          
437B- EE 9C FE             INC   $FE9C                          
437E- 2C 96 F1  L437E      BIT   $F196                          
4381- 8C 9A FE  L4381      STY   $FE9A                          
4384- 70 01                BVS   L4387                          
4386- E8                   INX                                  
4387- 8E 9D FE  L4387      STX   $FE9D                          
438A- 08                   PHP                                  
438B- 18                   CLC                                  
438C- 98                   TYA                                  
438D- 65 4E                ADC   RNDL                           
438F- 85 4E                STA   RNDL                           
4391- 90 02                BCC   L4395                          
4393- E6 4F                INC   RNDH                           
4395- 28        L4395      PLP                                  
4396- 60                   RTS                                  
4397- A5 4A                LDA   $4A                            
4399- 85 4E                STA   RNDL                           
439B- A5 4B                LDA   $4B                            
439D- 85 4F                STA   RNDH                           
439F- AC 82 FE             LDY   $FE82                          
43A2- 4C E6 E1             JMP   $E1E6                          
43A5- 20 36 EC  L43A5      JSR   $EC36                          
43A8- B0 2F                BCS   L43D9                          
43AA- 20 FA F0             JSR   $F0FA                          
43AD- 20 24 F1             JSR   $F124                          
43B0- 50 F3                BVC   L43A5                          
43B2- 20 E3 F0             JSR   $F0E3                          
43B5- 90 20                BCC   L43D7                          
43B7- C9 4C                CMP   #$4C                           
43B9- 38                   SEC                                  
43BA- D0 1C                BNE   L43D8                          
43BC- 20 7D ED             JSR   $ED7D                          
43BF- 20 5B ED             JSR   $ED5B                          
43C2- A0 00                LDY   #$00                           
43C4- AE 82 FE             LDX   $FE82                          
43C7- BD 10 D8  L43C7      LDA   $D810,X                        
43CA- 91 4A                STA   ($4A),Y                        
43CC- A9 00                LDA   #$00                           
43CE- 9D 10 D8             STA   $D810,X                        
43D1- E8                   INX                                  
43D2- C8                   INY                                  
43D3- C0 02                CPY   #$02                           
43D5- D0 F0                BNE   L43C7                          
43D7- 18        L43D7      CLC                                  
43D8- 60        L43D8      RTS                                  
43D9- 4C DC F0  L43D9      JMP   $F0DC                          
43DC- A0 04                LDY   #$04                           
43DE- B1 40                LDA   (A3L),Y                        
43E0- 8D CA FE             STA   $FECA                          
43E3- 8D 9D FE             STA   $FE9D                          
43E6- C8                   INY                                  
43E7- B1 40                LDA   (A3L),Y                        
43E9- 8D CB FE             STA   $FECB                          
43EC- 8D 9E FE             STA   $FE9E                          
43EF- AC 82 FE             LDY   $FE82                          
43F2- B9 09 D8             LDA   $D809,Y                        
43F5- 18                   CLC                                  
43F6- 60                   RTS                                  
43F7- A0 02                LDY   #$02                           
43F9- B1 40                LDA   (A3L),Y                        
43FB- 85 4E                STA   RNDL                           
43FD- C8                   INY                                  
43FE- B1 40                LDA   (A3L),Y                        
4400- 85 4F                STA   RNDH                           
4402- AC 82 FE             LDY   $FE82                          
4405- B9 07 D8             LDA   $D807,Y                        
4408- 60                   RTS                                  
4409- A2 00                LDX   #$00                           
440B- AC 82 FE             LDY   $FE82                          
440E- 18                   CLC                                  
440F- B9 12 D8  L440F      LDA   $D812,Y                        
4412- 9D 9A FE             STA   $FE9A,X                        
4415- 9D 7D FE             STA   $FE7D,X                        
4418- 7D CA FE             ADC   $FECA,X                        
441B- 9D 76 FE             STA   $FE76,X                        
441E- 8A                   TXA                                  
441F- 49 02                EOR   #$02                           
4421- F0 04                BEQ   L4427                          
4423- C8                   INY                                  
4424- E8                   INX                                  
4425- D0 E8                BNE   L440F                          
4427- BD 76 FE  L4427      LDA   $FE76,X                        
442A- D9 15 D8             CMP   $D815,Y                        
442D- 90 06                BCC   L4435                          
442F- D0 04                BNE   L4435                          
4431- 88                   DEY                                  
4432- CA                   DEX                                  
4433- 10 F2                BPL   L4427                          
4435- 60        L4435      RTS                                  
4436- 20 68 F2             JSR   $F268                          
4439- BD 7A FE  L4439      LDA   $FE7A,X                        
443C- 99 15 D8             STA   $D815,Y                        
443F- BD 7D FE             LDA   $FE7D,X                        
4442- 99 12 D8             STA   $D812,Y                        
4445- 9D 76 FE             STA   $FE76,X                        
4448- 88                   DEY                                  
4449- CA                   DEX                                  
444A- 10 ED                BPL   L4439                          
444C- 20 68 F2             JSR   $F268                          
444F- 20 27 F2             JSR   $F227                          
4452- 20 68 F2             JSR   $F268                          
4455- B9 15 D8  L4455      LDA   $D815,Y                        
4458- 9D 7A FE             STA   $FE7A,X                        
445B- 90 06                BCC   L4463                          
445D- BD 76 FE             LDA   $FE76,X                        
4460- 99 15 D8             STA   $D815,Y                        
4463- 88        L4463      DEY                                  
4464- CA                   DEX                                  
4465- 10 EE                BPL   L4455                          
4467- 60                   RTS                                  
4468- A9 02                LDA   #$02                           
446A- AA                   TAX                                  
446B- 0D 82 FE             ORA   $FE82                          
446E- A8                   TAY                                  
446F- 60                   RTS                                  
4470- 20 DC F1             JSR   $F1DC                          
4473- 48                   PHA                                  
4474- 20 09 F2             JSR   $F209                          
4477- 20 52 F2             JSR   $F252                          
447A- 68                   PLA                                  
447B- 29 02                AND   #$02                           
447D- D0 04                BNE   L4483                          
447F- A9 4E     L447F      LDA   #$4E                           
4481- D0 40                BNE   L44C3                          
4483- 20 39 F4  L4483      JSR   $F439                          
4486- B0 3B                BCS   L44C3                          
4488- AD CA FE             LDA   $FECA                          
448B- 0D CB FE             ORA   $FECB                          
448E- D0 03                BNE   L4493                          
4490- 4C E3 F0             JMP   $F0E3                          
4493- 20 F7 F1  L4493      JSR   $F1F7                          
4496- C9 04                CMP   #$04                           
4498- B0 E5                BCS   L447F                          
449A- 20 36 EC  L449A      JSR   $EC36                          
449D- B0 24                BCS   L44C3                          
449F- 20 E9 F5             JSR   $F5E9                          
44A2- 29 07                AND   #$07                           
44A4- F0 62                BEQ   L4508                          
44A6- A0 00                LDY   #$00                           
44A8- C8        L44A8      INY                                  
44A9- 4A                   LSR                                  
44AA- D0 FC                BNE   L44A8                          
44AC- 8C 84 FE             STY   SETNORM                        
44AF- 8D 85 FE             STA   $FE85                          
44B2- 20 5D E9             JSR   $E95D                          
44B5- B0 0C                BCS   L44C3                          
44B7- 20 E9 F5             JSR   $F5E9                          
44BA- 29 04                AND   #$04                           
44BC- F0 0D                BEQ   L44CB                          
44BE- 20 89 F3             JSR   $F389                          
44C1- 90 14                BCC   L44D7                          
44C3- 48        L44C3      PHA                                  
44C4- 20 36 F2             JSR   $F236                          
44C7- 68                   PLA                                  
44C8- 4C DC F0             JMP   $F0DC                          
44CB- 20 E9 F5  L44CB      JSR   $F5E9                          
44CE- 29 02                AND   #$02                           
44D0- F0 05                BEQ   L44D7                          
44D2- 20 C5 F3             JSR   $F3C5                          
44D5- B0 EC                BCS   L44C3                          
44D7- 20 19 F4  L44D7      JSR   $F419                          
44DA- B0 E7                BCS   L44C3                          
44DC- 20 E9 F5             JSR   $F5E9                          
44DF- 09 80                ORA   #$80                           
44E1- 29 F8                AND   #$F8                           
44E3- 99 08 D8             STA   $D808,Y                        
44E6- AD 9C FE             LDA   $FE9C                          
44E9- 4A                   LSR                                  
44EA- AD 9B FE             LDA   $FE9B                          
44ED- 6A                   ROR                                  
44EE- A8                   TAY                                  
44EF- E6 49                INC   $49                            
44F1- AD 77 FE             LDA   $FE77                          
44F4- AA                   TAX                                  
44F5- 91 48                STA   ($48),Y                        
44F7- C6 49                DEC   $49                            
44F9- AD 76 FE             LDA   $FE76                          
44FC- 91 48                STA   ($48),Y                        
44FE- AC 82 FE             LDY   $FE82                          
4501- 99 10 D8             STA   $D810,Y                        
4504- 8A                   TXA                                  
4505- 99 11 D8             STA   $D811,Y                        
4508- 20 FA F0  L4508      JSR   $F0FA                          
450B- 20 13 F3             JSR   $F313                          
450E- 50 8A                BVC   L449A                          
4510- 4C E3 F0             JMP   $F0E3                          
4513- 8A                   TXA                                  
4514- D0 08                BNE   L451E                          
4516- AD 9E FE             LDA   $FE9E                          
4519- F0 4B                BEQ   L4566                          
451B- CE 9E FE             DEC   $FE9E                          
451E- CA        L451E      DEX                                  
451F- B1 4E                LDA   (RNDL),Y                       
4521- 91 4C                STA   ($4C),Y                        
4523- 8A                   TXA                                  
4524- F0 1E                BEQ   L4544                          
4526- C8                   INY                                  
4527- D0 F5                BNE   L451E                          
4529- A5 4D                LDA   $4D                            
452B- E6 4F                INC   RNDH                           
452D- EE 9B FE             INC   $FE9B                          
4530- D0 09                BNE   L453B                          
4532- EE 9C FE             INC   $FE9C                          
4535- D0 04                BNE   L453B                          
4537- A9 4D                LDA   #$4D                           
4539- D0 88                BNE   L44C3                          
453B- E6 4D     L453B      INC   $4D                            
453D- 45 4B                EOR   $4B                            
453F- F0 DD                BEQ   L451E                          
4541- B8                   CLV                                  
4542- 50 25                BVC   L4569                          
4544- AD 9E FE  L4544      LDA   $FE9E                          
4547- F0 10                BEQ   L4559                          
4549- C8                   INY                                  
454A- D0 06                BNE   L4552                          
454C- A5 4D                LDA   $4D                            
454E- 45 4B                EOR   $4B                            
4550- D0 03                BNE   L4555                          
4552- CE 9E FE  L4552      DEC   $FE9E                          
4555- 88        L4555      DEY                                  
4556- 4C 26 F3             JMP   $F326                          
4559- C8        L4559      INY                                  
455A- D0 0A                BNE   L4566                          
455C- E6 4F                INC   RNDH                           
455E- EE 9B FE             INC   $FE9B                          
4561- D0 03                BNE   L4566                          
4563- EE 9C FE             INC   $FE9C                          
4566- 2C 96 F1  L4566      BIT   $F196                          
4569- 8C 9A FE  L4569      STY   $FE9A                          
456C- 8E 9D FE             STX   $FE9D                          
456F- 08                   PHP                                  
4570- 20 E9 F5             JSR   $F5E9                          
4573- 09 50                ORA   #$50                           
4575- 99 08 D8             STA   $D808,Y                        
4578- 18                   CLC                                  
4579- AD 9A FE             LDA   $FE9A                          
457C- 65 4E                ADC   RNDL                           
457E- 85 4E                STA   RNDL                           
4580- 90 02                BCC   L4584                          
4582- E6 4F                INC   RNDH                           
4584- 20 4E FA  L4584      JSR   $FA4E                          
4587- 28                   PLP                                  
4588- 60                   RTS                                  
4589- 20 D2 F3             JSR   $F3D2                          
458C- B0 43                BCS   L45D1                          
458E- 20 02 F2             JSR   $F202                          
4591- C9 03                CMP   #$03                           
4593- F0 05                BEQ   L459A                          
4595- 20 D2 F3             JSR   $F3D2                          
4598- B0 37                BCS   L45D1                          
459A- 20 19 F4  L459A      JSR   $F419                          
459D- B0 32                BCS   L45D1                          
459F- AD 9C FE             LDA   $FE9C                          
45A2- 4A                   LSR                                  
45A3- A8                   TAY                                  
45A4- AD 76 FE             LDA   $FE76                          
45A7- AA                   TAX                                  
45A8- 91 48                STA   ($48),Y                        
45AA- E6 49                INC   $49                            
45AC- AD 77 FE             LDA   $FE77                          
45AF- 91 48                STA   ($48),Y                        
45B1- C6 49                DEC   $49                            
45B3- AC 82 FE             LDY   $FE82                          
45B6- 99 0F D8             STA   $D80F,Y                        
45B9- 8A                   TXA                                  
45BA- 99 0E D8             STA   $D80E,Y                        
45BD- 20 7F EE             JSR   $EE7F                          
45C0- B0 0F                BCS   L45D1                          
45C2- 4C 49 ED             JMP   $ED49                          
45C5- 20 02 F2             JSR   $F202                          
45C8- C9 01                CMP   #$01                           
45CA- F0 06                BEQ   L45D2                          
45CC- 20 2C EE             JSR   $EE2C                          
45CF- 90 C9                BCC   L459A                          
45D1- 60        L45D1      RTS                                  
45D2- 20 19 F4  L45D2      JSR   $F419                          
45D5- B0 41                BCS   L4618                          
45D7- AC 82 FE             LDY   $FE82                          
45DA- B9 0C D8             LDA   $D80C,Y                        
45DD- 48                   PHA                                  
45DE- AD 76 FE             LDA   $FE76                          
45E1- AA                   TAX                                  
45E2- 99 0C D8             STA   $D80C,Y                        
45E5- B9 0D D8             LDA   $D80D,Y                        
45E8- 48                   PHA                                  
45E9- AD 77 FE             LDA   $FE77                          
45EC- 99 0D D8             STA   $D80D,Y                        
45EF- 99 0F D8             STA   $D80F,Y                        
45F2- 8A                   TXA                                  
45F3- 99 0E D8             STA   $D80E,Y                        
45F6- A0 00                LDY   #$00                           
45F8- E6 49                INC   $49                            
45FA- 68                   PLA                                  
45FB- 91 48                STA   ($48),Y                        
45FD- C6 49                DEC   $49                            
45FF- 68                   PLA                                  
4600- 91 48                STA   ($48),Y                        
4602- 20 7F EE             JSR   $EE7F                          
4605- B0 11                BCS   L4618                          
4607- 20 02 F2             JSR   $F202                          
460A- 69 01                ADC   #$01                           
460C- 99 07 D8             STA   $D807,Y                        
460F- B9 08 D8             LDA   $D808,Y                        
4612- 09 08                ORA   #$08                           
4614- 99 08 D8             STA   $D808,Y                        
4617- 18                   CLC                                  
4618- 60        L4618      RTS                                  
4619- 20 A0 EA             JSR   $EAA0                          
461C- B0 1A                BCS   L4638                          
461E- 20 E9 F5             JSR   $F5E9                          
4621- 09 10                ORA   #$10                           
4623- 99 08 D8             STA   $D808,Y                        
4626- B9 18 D8             LDA   $D818,Y                        
4629- 18                   CLC                                  
462A- 69 01                ADC   #$01                           
462C- 99 18 D8             STA   $D818,Y                        
462F- B9 19 D8             LDA   $D819,Y                        
4632- 69 00                ADC   #$00                           
4634- 99 19 D8             STA   $D819,Y                        
4637- 18        L4637      CLC                                  
4638- 60        L4638      RTS                                  
4639- 20 E9 F5             JSR   $F5E9                          
463C- 29 F0                AND   #$F0                           
463E- D0 F7                BNE   L4637                          
4640- B9 01 D8             LDA   $D801,Y                        
4643- 8D 30 BF             STA   $BF30                          
4646- 85 43                STA   A4H                            
4648- A5 47                LDA   $47                            
464A- 48                   PHA                                  
464B- A5 46                LDA   $46                            
464D- 48                   PHA                                  
464E- A9 00                LDA   #$00                           
4650- 85 42                STA   A4L                            
4652- 85 46                STA   $46                            
4654- 85 47                STA   $47                            
4656- 08                   PHP                                  
4657- 78                   SEI                                  
4658- 20 E4 DE             JSR   $DEE4                          
465B- B0 02                BCS   L465F                          
465D- A9 00                LDA   #$00                           
465F- 28        L465F      PLP                                  
4660- 18                   CLC                                  
4661- AA                   TAX                                  
4662- F0 01                BEQ   L4665                          
4664- 38                   SEC                                  
4665- 68        L4665      PLA                                  
4666- 85 46                STA   $46                            
4668- 68                   PLA                                  
4669- 85 47                STA   $47                            
466B- 8A                   TXA                                  
466C- 60                   RTS                                  
466D- A0 01                LDY   #$01                           
466F- B1 40                LDA   (A3L),Y                        
4671- D0 34                BNE   L46A7                          
4673- 8D AE FE             STA   $FEAE                          
4676- A9 00                LDA   #$00                           
4678- 8D 82 FE  L4678      STA   $FE82                          
467B- A8                   TAY                                  
467C- B9 1B D8             LDA   $D81B,Y                        
467F- CD 94 BF             CMP   $BF94                          
4682- 90 15                BCC   L4699                          
4684- B9 00 D8             LDA   $D800,Y                        
4687- F0 10                BEQ   L4699                          
4689- 20 05 F5             JSR   $F505                          
468C- B0 4C                BCS   L46DA                          
468E- 20 AC F4             JSR   $F4AC                          
4691- A0 01                LDY   #$01                           
4693- B1 40                LDA   (A3L),Y                        
4695- F0 02                BEQ   L4699                          
4697- B0 41                BCS   L46DA                          
4699- AD 82 FE  L4699      LDA   $FE82                          
469C- 18                   CLC                                  
469D- 69 20                ADC   #$20                           
469F- 90 D7                BCC   L4678                          
46A1- AD AE FE             LDA   $FEAE                          
46A4- F0 32                BEQ   L46D8                          
46A6- 60                   RTS                                  
46A7- 20 0D F5  L46A7      JSR   $F50D                          
46AA- B0 2E                BCS   L46DA                          
46AC- AC 82 FE             LDY   $FE82                          
46AF- B9 0B D8             LDA   $D80B,Y                        
46B2- 20 51 FC             JSR   $FC51                          
46B5- B0 23                BCS   L46DA                          
46B7- A9 00                LDA   #$00                           
46B9- AC 82 FE             LDY   $FE82                          
46BC- 99 00 D8             STA   $D800,Y                        
46BF- B9 01 D8             LDA   $D801,Y                        
46C2- 8D 30 BF             STA   $BF30                          
46C5- 20 5D E8             JSR   $E85D                          
46C8- AE 81 FE             LDX   $FE81                          
46CB- DE 1E D9             DEC   $D91E,X                        
46CE- D0 08                BNE   L46D8                          
46D0- BD 11 D9             LDA   $D911,X                        
46D3- 29 7F                AND   #$7F                           
46D5- 9D 11 D9             STA   $D911,X                        
46D8- 18        L46D8      CLC                                  
46D9- 60                   RTS                                  
46DA- B0 2E     L46DA      BCS   L470A                          
46DC- A0 01                LDY   #$01                           
46DE- B1 40                LDA   (A3L),Y                        
46E0- D0 2B                BNE   L470D                          
46E2- 8D AE FE             STA   $FEAE                          
46E5- A9 00                LDA   #$00                           
46E7- 8D 82 FE  L46E7      STA   $FE82                          
46EA- A8                   TAY                                  
46EB- B9 00 D8             LDA   $D800,Y                        
46EE- F0 05                BEQ   L46F5                          
46F0- 20 05 F5             JSR   $F505                          
46F3- B0 15                BCS   L470A                          
46F5- AD 82 FE  L46F5      LDA   $FE82                          
46F8- 18                   CLC                                  
46F9- 69 20                ADC   #$20                           
46FB- 90 EA                BCC   L46E7                          
46FD- 18        L46FD      CLC                                  
46FE- AD AE FE             LDA   $FEAE                          
4701- F0 01                BEQ   L4704                          
4703- 38                   SEC                                  
4704- 60        L4704      RTS                                  
4705- 20 E6 E1             JSR   $E1E6                          
4708- 90 0D                BCC   L4717                          
470A- 4C DA F5  L470A      JMP   $F5DA                          
470D- A9 00     L470D      LDA   #$00                           
470F- 8D AE FE             STA   $FEAE                          
4712- 20 CB E1             JSR   $E1CB                          
4715- B0 F3                BCS   L470A                          
4717- B9 09 D8  L4717      LDA   $D809,Y                        
471A- 29 02                AND   #$02                           
471C- F0 DF                BEQ   L46FD                          
471E- B9 1C D8             LDA   $D81C,Y                        
4721- 30 07                BMI   L472A                          
4723- 20 E9 F5             JSR   $F5E9                          
4726- 29 70                AND   #$70                           
4728- F0 D3                BEQ   L46FD                          
472A- 20 E9 F5  L472A      JSR   $F5E9                          
472D- 29 40                AND   #$40                           
472F- F0 05                BEQ   L4736                          
4731- 20 85 EE             JSR   $EE85                          
4734- B0 D4                BCS   L470A                          
4736- 20 E9 F5  L4736      JSR   $F5E9                          
4739- 29 80                AND   #$80                           
473B- F0 05                BEQ   L4742                          
473D- 20 99 EE             JSR   $EE99                          
4740- B0 C8                BCS   L470A                          
4742- A9 06     L4742      LDA   #$06                           
4744- AA                   TAX                                  
4745- 0D 82 FE             ORA   $FE82                          
4748- A8                   TAY                                  
4749- B9 00 D8  L4749      LDA   $D800,Y                        
474C- 9D 48 FE             STA   $FE48,X                        
474F- 88                   DEY                                  
4750- CA                   DEX                                  
4751- D0 F6                BNE   L4749                          
4753- 8D 30 BF             STA   $BF30                          
4756- AD 4A FE             LDA   $FE4A                          
4759- AE 4B FE             LDX   $FE4B                          
475C- 20 CD EB             JSR   $EBCD                          
475F- B0 A9                BCS   L470A                          
4761- 20 99 E6             JSR   $E699                          
4764- AD 4C FE             LDA   $FE4C                          
4767- AC 4D FE             LDY   $FE4D                          
476A- CD 4A FE             CMP   $FE4A                          
476D- D0 05                BNE   L4774                          
476F- CC 4B FE             CPY   $FE4B                          
4772- F0 07                BEQ   L477B                          
4774- 85 46     L4774      STA   $46                            
4776- 84 47                STY   $47                            
4778- 20 DD EB             JSR   $EBDD                          
477B- 20 9D E4  L477B      JSR   $E49D                          
477E- 20 9C E5             JSR   $E59C                          
4781- AC 82 FE             LDY   $FE82                          
4784- B9 18 D8             LDA   $D818,Y                        
4787- 8D 62 FE             STA   $FE62                          
478A- B9 19 D8             LDA   $D819,Y                        
478D- 8D 63 FE             STA   $FE63                          
4790- A2 00                LDX   #$00                           
4792- B9 15 D8  L4792      LDA   $D815,Y                        
4795- 9D 64 FE             STA   $FE64,X                        
4798- E8                   INX                                  
4799- E0 03                CPX   #$03                           
479B- F0 09                BEQ   L47A6                          
479D- B9 0C D8             LDA   $D80C,Y                        
47A0- 9D 5F FE             STA   $FE5F,X                        
47A3- C8                   INY                                  
47A4- D0 EC                BNE   L4792                          
47A6- B9 05 D8  L47A6      LDA   $D805,Y                        
47A9- 0A                   ASL                                  
47AA- 0A                   ASL                                  
47AB- 0A                   ASL                                  
47AC- 0A                   ASL                                  
47AD- 8D 76 FE             STA   $FE76                          
47B0- AD 4F FE             LDA   $FE4F                          
47B3- 29 0F                AND   #$0F                           
47B5- 0D 76 FE             ORA   $FE76                          
47B8- 8D 4F FE             STA   $FE4F                          
47BB- 20 B6 E4             JSR   $E4B6                          
47BE- B0 1A                BCS   L47DA                          
47C0- AC 82 FE             LDY   $FE82                          
47C3- B9 1C D8             LDA   $D81C,Y                        
47C6- 29 7F                AND   #$7F                           
47C8- 99 1C D8             STA   $D81C,Y                        
47CB- AD 49 FE             LDA   $FE49                          
47CE- CD 96 FE             CMP   $FE96                          
47D1- D0 05                BNE   L47D8                          
47D3- 20 7A EB             JSR   $EB7A                          
47D6- B0 02                BCS   L47DA                          
47D8- 18        L47D8      CLC                                  
47D9- 60                   RTS                                  
47DA- A0 01     L47DA      LDY   #$01                           
47DC- 48                   PHA                                  
47DD- B1 40                LDA   (A3L),Y                        
47DF- D0 06                BNE   L47E7                          
47E1- 18                   CLC                                  
47E2- 68                   PLA                                  
47E3- 8D AE FE             STA   $FEAE                          
47E6- 60                   RTS                                  
47E7- 68        L47E7      PLA                                  
47E8- 60                   RTS                                  
47E9- AC 82 FE             LDY   $FE82                          
47EC- B9 08 D8             LDA   $D808,Y                        
47EF- 60                   RTS                                  
47F0- A9 4E     L47F0      LDA   #$4E                           
47F2- 38                   SEC                                  
47F3- 60        L47F3      RTS                                  
47F4- 20 02 F2             JSR   $F202                          
47F7- C9 04                CMP   #$04                           
47F9- B0 F5                BCS   L47F0                          
47FB- 0A                   ASL                                  
47FC- 0A                   ASL                                  
47FD- 0A                   ASL                                  
47FE- 0A                   ASL                                  
47FF- 8D B1 FE             STA   $FEB1                          
4802- B9 09 D8             LDA   $D809,Y                        
4805- 29 02                AND   #$02                           
4807- F0 E7                BEQ   L47F0                          
4809- 20 39 F4             JSR   $F439                          
480C- B0 E2                BCS   L47F0                          
480E- AC 82 FE             LDY   $FE82                          
4811- C8                   INY                                  
4812- C8                   INY                                  
4813- A2 02                LDX   #$02                           
4815- B9 15 D8  L4815      LDA   $D815,Y                        
4818- 9D 7A FE             STA   $FE7A,X                        
481B- 88                   DEY                                  
481C- CA                   DEX                                  
481D- 10 F6                BPL   L4815                          
481F- A0 04                LDY   #$04                           
4821- A2 02                LDX   #$02                           
4823- B1 40     L4823      LDA   (A3L),Y                        
4825- 9D 9A FE             STA   $FE9A,X                        
4828- 88                   DEY                                  
4829- CA                   DEX                                  
482A- 10 F7                BPL   L4823                          
482C- A2 02                LDX   #$02                           
482E- BD 7A FE  L482E      LDA   $FE7A,X                        
4831- DD 9A FE             CMP   $FE9A,X                        
4834- 90 05                BCC   L483B                          
4836- D0 18                BNE   L4850                          
4838- CA                   DEX                                  
4839- 10 F3                BPL   L482E                          
483B- A0 04     L483B      LDY   #$04                           
483D- AE 82 FE             LDX   $FE82                          
4840- E8                   INX                                  
4841- E8                   INX                                  
4842- B1 40     L4842      LDA   (A3L),Y                        
4844- 9D 15 D8             STA   $D815,X                        
4847- CA                   DEX                                  
4848- 88                   DEY                                  
4849- C0 02                CPY   #$02                           
484B- B0 F5                BCS   L4842                          
484D- 4C 4E FA             JMP   $FA4E                          
4850- 20 0D F5  L4850      JSR   $F50D                          
4853- B0 9E                BCS   L47F3                          
4855- A6 4B                LDX   $4B                            
4857- E8                   INX                                  
4858- E8                   INX                                  
4859- 86 49                STX   $49                            
485B- A6 4A                LDX   $4A                            
485D- 86 48                STX   $48                            
485F- AC 82 FE             LDY   $FE82                          
4862- C8                   INY                                  
4863- C8                   INY                                  
4864- A2 02                LDX   #$02                           
4866- B9 12 D8  L4866      LDA   $D812,Y                        
4869- DD 9A FE             CMP   $FE9A,X                        
486C- 90 17                BCC   L4885                          
486E- D0 04                BNE   L4874                          
4870- 88                   DEY                                  
4871- CA                   DEX                                  
4872- 10 F2                BPL   L4866                          
4874- AC 82 FE  L4874      LDY   $FE82                          
4877- A2 00                LDX   #$00                           
4879- BD 9A FE  L4879      LDA   $FE9A,X                        
487C- 99 12 D8             STA   $D812,Y                        
487F- C8                   INY                                  
4880- E8                   INX                                  
4881- E0 03                CPX   #$03                           
4883- D0 F4                BNE   L4879                          
4885- 20 68 E9  L4885      JSR   $E968                          
4888- AD 9A FE             LDA   $FE9A                          
488B- 8D B6 FE             STA   $FEB6                          
488E- AD 9B FE             LDA   $FE9B                          
4891- 8D B5 FE             STA   $FEB5                          
4894- 29 01                AND   #$01                           
4896- 8D B7 FE             STA   $FEB7                          
4899- AD 9C FE             LDA   $FE9C                          
489C- 4A                   LSR                                  
489D- 8D B4 FE             STA   $FEB4                          
48A0- 6E B5 FE             ROR   $FEB5                          
48A3- AD B6 FE             LDA   $FEB6                          
48A6- 0D B7 FE             ORA   $FEB7                          
48A9- D0 1D                BNE   L48C8                          
48AB- AD B5 FE             LDA   $FEB5                          
48AE- 38                   SEC                                  
48AF- E9 01                SBC   #$01                           
48B1- 8D B5 FE             STA   $FEB5                          
48B4- A9 02                LDA   #$02                           
48B6- B0 0D                BCS   L48C5                          
48B8- CE B4 FE             DEC   $FEB4                          
48BB- 10 08                BPL   L48C5                          
48BD- A9 00                LDA   #$00                           
48BF- 8D B4 FE             STA   $FEB4                          
48C2- 8D B5 FE             STA   $FEB5                          
48C5- 8D B7 FE  L48C5      STA   $FEB7                          
48C8- AC 82 FE  L48C8      LDY   $FE82                          
48CB- B9 0C D8             LDA   $D80C,Y                        
48CE- 8D AF FE             STA   $FEAF                          
48D1- B9 0D D8             LDA   $D80D,Y                        
48D4- 8D B0 FE             STA   $FEB0                          
48D7- A9 00                LDA   #$00                           
48D9- 8D B2 FE             STA   $FEB2                          
48DC- 8D B3 FE             STA   $FEB3                          
48DF- 20 60 FA             JSR   $FA60                          
48E2- 08                   PHP                                  
48E3- 48                   PHA                                  
48E4- 38                   SEC                                  
48E5- AC 82 FE             LDY   $FE82                          
48E8- A2 00                LDX   #$00                           
48EA- BD AF FE  L48EA      LDA   $FEAF,X                        
48ED- 99 0C D8             STA   $D80C,Y                        
48F0- B9 18 D8             LDA   $D818,Y                        
48F3- FD B2 FE             SBC   $FEB2,X                        
48F6- 99 18 D8             STA   $D818,Y                        
48F9- C8                   INY                                  
48FA- E8                   INX                                  
48FB- 8A                   TXA                                  
48FC- 29 01                AND   #$01                           
48FE- D0 EA                BNE   L48EA                          
4900- AD B1 FE             LDA   $FEB1                          
4903- 4A                   LSR                                  
4904- 4A                   LSR                                  
4905- 4A                   LSR                                  
4906- 4A                   LSR                                  
4907- AC 82 FE             LDY   $FE82                          
490A- 99 07 D8             STA   $D807,Y                        
490D- 20 A3 ED             JSR   $EDA3                          
4910- 20 E0 F9             JSR   $F9E0                          
4913- AC 82 FE             LDY   $FE82                          
4916- C8                   INY                                  
4917- C8                   INY                                  
4918- A2 02                LDX   #$02                           
491A- B9 12 D8  L491A      LDA   $D812,Y                        
491D- 9D 9A FE             STA   $FE9A,X                        
4920- 49 80                EOR   #$80                           
4922- 99 12 D8             STA   $D812,Y                        
4925- 88                   DEY                                  
4926- CA                   DEX                                  
4927- 10 F1                BPL   L491A                          
4929- 20 36 EC             JSR   $EC36                          
492C- 90 07                BCC   L4935                          
492E- AA                   TAX                                  
492F- 68                   PLA                                  
4930- 28                   PLP                                  
4931- 8A                   TXA                                  
4932- 38                   SEC                                  
4933- 08                   PHP                                  
4934- 48                   PHA                                  
4935- 20 3B F6  L4935      JSR   $F63B                          
4938- 20 0D F5             JSR   $F50D                          
493B- 90 07                BCC   L4944                          
493D- AA                   TAX                                  
493E- 68                   PLA                                  
493F- 28                   PLP                                  
4940- 8A                   TXA                                  
4941- 38                   SEC                                  
4942- 08                   PHP                                  
4943- 48                   PHA                                  
4944- 68        L4944      PLA                                  
4945- 28                   PLP                                  
4946- 60                   RTS                                  
4947- AE 82 FE             LDX   $FE82                          
494A- A0 02                LDY   #$02                           
494C- BD 15 D8  L494C      LDA   $D815,X                        
494F- 91 40                STA   (A3L),Y                        
4951- E8                   INX                                  
4952- C8                   INY                                  
4953- C0 05                CPY   #$05                           
4955- D0 F5                BNE   L494C                          
4957- 18                   CLC                                  
4958- 60                   RTS                                  
4959- A0 02                LDY   #$02                           
495B- B1 40                LDA   (A3L),Y                        
495D- AE 82 FE             LDX   $FE82                          
4960- 9D 1F D8             STA   $D81F,X                        
4963- C8                   INY                                  
4964- B1 40                LDA   (A3L),Y                        
4966- 9D 0A D8             STA   $D80A,X                        
4969- 18                   CLC                                  
496A- 60                   RTS                                  
496B- 20 97 E5             JSR   $E597                          
496E- 90 42                BCC   L49B2                          
4970- C9 40                CMP   #$40                           
4972- 38                   SEC                                  
4973- D0 5A                BNE   L49CF                          
4975- A9 F0                LDA   #$F0                           
4977- 8D 4F FE             STA   $FE4F                          
497A- A9 00                LDA   #$00                           
497C- 8D 84 FE             STA   SETNORM                        
497F- 8D 85 FE             STA   $FE85                          
4982- AE 81 FE             LDX   $FE81                          
4985- 20 68 E9             JSR   $E968                          
4988- AE 81 FE             LDX   $FE81                          
498B- BD 15 D9             LDA   $D915,X                        
498E- 8D 85 FE             STA   $FE85                          
4991- BD 14 D9             LDA   $D914,X                        
4994- 8D 84 FE             STA   SETNORM                        
4997- BD 13 D9             LDA   $D913,X                        
499A- 8D 6F FE             STA   $FE6F                          
499D- 48                   PHA                                  
499E- BD 12 D9             LDA   $D912,X                        
49A1- 8D 6E FE             STA   $FE6E                          
49A4- 38                   SEC                                  
49A5- ED 84 FE             SBC   SETNORM                        
49A8- 8D 62 FE             STA   $FE62                          
49AB- 68                   PLA                                  
49AC- ED 85 FE             SBC   $FE85                          
49AF- 8D 63 FE             STA   $FE63                          
49B2- AD 4F FE  L49B2      LDA   $FE4F                          
49B5- 4A                   LSR                                  
49B6- 4A                   LSR                                  
49B7- 4A                   LSR                                  
49B8- 4A                   LSR                                  
49B9- 8D 4F FE             STA   $FE4F                          
49BC- A0 11                LDY   #$11                           
49BE- B9 10 FE  L49BE      LDA   $FE10,Y                        
49C1- 29 7F                AND   #$7F                           
49C3- AA                   TAX                                  
49C4- BD 4F FE             LDA   $FE4F,X                        
49C7- 91 40                STA   (A3L),Y                        
49C9- 88                   DEY                                  
49CA- C0 03                CPY   #$03                           
49CC- B0 F0                BCS   L49BE                          
49CE- 18                   CLC                                  
49CF- 60        L49CF      RTS                                  
49D0- 20 97 E5             JSR   $E597                          
49D3- B0 25                BCS   L49FA                          
49D5- AD 95 BF             LDA   $BF95                          
49D8- 49 20                EOR   #$20                           
49DA- 2D 6D FE             AND   $FE6D                          
49DD- 29 20                AND   #$20                           
49DF- 8D A4 FE             STA   $FEA4                          
49E2- A0 0D                LDY   #$0D                           
49E4- BE 10 FE  L49E4      LDX   $FE10,Y                        
49E7- 30 05                BMI   L49EE                          
49E9- B1 40                LDA   (A3L),Y                        
49EB- 9D 4F FE             STA   $FE4F,X                        
49EE- 88        L49EE      DEY                                  
49EF- C0 03                CPY   #$03                           
49F1- B0 F1                BCS   L49E4                          
49F3- 29 18                AND   #$18                           
49F5- F0 04                BEQ   L49FB                          
49F7- A9 4E                LDA   #$4E                           
49F9- 38                   SEC                                  
49FA- 60        L49FA      RTS                                  
49FB- A0 0B     L49FB      LDY   #$0B                           
49FD- B1 40                LDA   (A3L),Y                        
49FF- F0 03                BEQ   L4A04                          
4A01- 4C C6 E4             JMP   $E4C6                          
4A04- 4C B6 E4  L4A04      JMP   $E4B6                          
4A07- 20 AA E5             JSR   $E5AA                          
4A0A- 90 3D                BCC   L4A49                          
4A0C- C9 40                CMP   #$40                           
4A0E- D0 18                BNE   L4A28                          
4A10- 20 2D F9             JSR   $F92D                          
4A13- B0 13                BCS   L4A28                          
4A15- AC 00 D7             LDY   $D700                          
4A18- C8                   INY                                  
4A19- B9 00 D7             LDA   $D700,Y                        
4A1C- D0 7F                BNE   L4A9D                          
4A1E- AE 81 FE             LDX   $FE81                          
4A21- BD 11 D9             LDA   $D911,X                        
4A24- 10 04                BPL   L4A2A                          
4A26- A9 50                LDA   #$50                           
4A28- 38        L4A28      SEC                                  
4A29- 60                   RTS                                  
4A2A- A0 00     L4A2A      LDY   #$00                           
4A2C- B9 00 D7             LDA   $D700,Y                        
4A2F- 09 F0                ORA   #$F0                           
4A31- 20 1E F9             JSR   $F91E                          
4A34- B0 69                BCS   L4A9F                          
4A36- A0 00                LDY   #$00                           
4A38- AE 81 FE             LDX   $FE81                          
4A3B- B9 00 D7  L4A3B      LDA   $D700,Y                        
4A3E- F0 07                BEQ   L4A47                          
4A40- 9D 00 D9             STA   $D900,X                        
4A43- C8                   INY                                  
4A44- E8                   INX                                  
4A45- D0 F4                BNE   L4A3B                          
4A47- 18        L4A47      CLC                                  
4A48- 60                   RTS                                  
4A49- 20 3B F9  L4A49      JSR   $F93B                          
4A4C- B9 00 D7  L4A4C      LDA   $D700,Y                        
4A4F- 9D 00 DC             STA   $DC00,X                        
4A52- 30 04                BMI   L4A58                          
4A54- C8                   INY                                  
4A55- E8                   INX                                  
4A56- D0 F4                BNE   L4A4C                          
4A58- 20 2D F9  L4A58      JSR   $F92D                          
4A5B- B0 42                BCS   L4A9F                          
4A5D- 20 3B F9             JSR   $F93B                          
4A60- B9 00 D7             LDA   $D700,Y                        
4A63- DD 00 DC  L4A63      CMP   $DC00,X                        
4A66- 08                   PHP                                  
4A67- 29 F0                AND   #$F0                           
4A69- D0 06                BNE   L4A71                          
4A6B- 8C A9 FE             STY   $FEA9                          
4A6E- 8E AA FE             STX   $FEAA                          
4A71- 28        L4A71      PLP                                  
4A72- D0 09                BNE   L4A7D                          
4A74- E8                   INX                                  
4A75- C8                   INY                                  
4A76- B9 00 D7             LDA   $D700,Y                        
4A79- D0 E8                BNE   L4A63                          
4A7B- 18                   CLC                                  
4A7C- 60                   RTS                                  
4A7D- AC A9 FE  L4A7D      LDY   $FEA9                          
4A80- B9 00 D7             LDA   $D700,Y                        
4A83- 38                   SEC                                  
4A84- 6D A9 FE             ADC   $FEA9                          
4A87- A8                   TAY                                  
4A88- B9 00 D7             LDA   $D700,Y                        
4A8B- D0 10                BNE   L4A9D                          
4A8D- AE AA FE             LDX   $FEAA                          
4A90- BD 00 DC             LDA   $DC00,X                        
4A93- 38                   SEC                                  
4A94- 6D AA FE             ADC   $FEAA                          
4A97- AA                   TAX                                  
4A98- BD 00 DC             LDA   $DC00,X                        
4A9B- F0 04                BEQ   L4AA1                          
4A9D- A9 40     L4A9D      LDA   #$40                           
4A9F- 38        L4A9F      SEC                                  
4AA0- 60                   RTS                                  
4AA1- 20 AA E5  L4AA1      JSR   $E5AA                          
4AA4- B0 04                BCS   L4AAA                          
4AA6- A9 47                LDA   #$47                           
4AA8- 38                   SEC                                  
4AA9- 60                   RTS                                  
4AAA- C9 46     L4AAA      CMP   #$46                           
4AAC- D0 F1                BNE   L4A9F                          
4AAE- 20 85 E0             JSR   $E085                          
4AB1- 20 97 E5             JSR   $E597                          
4AB4- B0 E9                BCS   L4A9F                          
4AB6- 20 9D EF             JSR   $EF9D                          
4AB9- A9 50                LDA   #$50                           
4ABB- B0 E2                BCS   L4A9F                          
4ABD- AD 6D FE             LDA   $FE6D                          
4AC0- 29 40                AND   #$40                           
4AC2- D0 04                BNE   L4AC8                          
4AC4- A9 4E                LDA   #$4E                           
4AC6- 38        L4AC6      SEC                                  
4AC7- 60                   RTS                                  
4AC8- AD 4F FE  L4AC8      LDA   $FE4F                          
4ACB- 29 F0                AND   #$F0                           
4ACD- C9 D0                CMP   #$D0                           
4ACF- F0 08                BEQ   L4AD9                          
4AD1- C9 40                CMP   #$40                           
4AD3- 90 04                BCC   L4AD9                          
4AD5- A9 4A                LDA   #$4A                           
4AD7- D0 ED                BNE   L4AC6                          
4AD9- 20 2D F9  L4AD9      JSR   $F92D                          
4ADC- B0 C1                BCS   L4A9F                          
4ADE- AC A9 FE             LDY   $FEA9                          
4AE1- BE 00 D7             LDX   $D700,Y                        
4AE4- 98                   TYA                                  
4AE5- 79 00 D7             ADC   $D700,Y                        
4AE8- A8                   TAY                                  
4AE9- B9 00 D7  L4AE9      LDA   $D700,Y                        
4AEC- 9D 4F FE             STA   $FE4F,X                        
4AEF- 88                   DEY                                  
4AF0- CA                   DEX                                  
4AF1- D0 F6                BNE   L4AE9                          
4AF3- AD 4F FE             LDA   $FE4F                          
4AF6- 29 F0                AND   #$F0                           
4AF8- AA                   TAX                                  
4AF9- 19 00 D7             ORA   $D700,Y                        
4AFC- 8D 4F FE             STA   $FE4F                          
4AFF- E0 D0                CPX   #$D0                           
4B01- D0 18                BNE   L4B1B                          
4B03- AD 60 FE             LDA   $FE60                          
4B06- AE 61 FE             LDX   $FE61                          
4B09- 20 CD EB             JSR   $EBCD                          
4B0C- B0 91                BCS   L4A9F                          
4B0E- AC A9 FE             LDY   $FEA9                          
4B11- B9 00 D7             LDA   $D700,Y                        
4B14- 09 E0                ORA   #$E0                           
4B16- 20 1E F9             JSR   $F91E                          
4B19- B0 84                BCS   L4A9F                          
4B1B- 4C C6 E4  L4B1B      JMP   $E4C6                          
4B1E- A2 00                LDX   #$00                           
4B20- 9D 04 DC  L4B20      STA   $DC04,X                        
4B23- E8                   INX                                  
4B24- C8                   INY                                  
4B25- B9 00 D7             LDA   $D700,Y                        
4B28- D0 F6                BNE   L4B20                          
4B2A- 4C D9 EB             JMP   $EBD9                          
4B2D- A0 03                LDY   #$03                           
4B2F- B1 40                LDA   (A3L),Y                        
4B31- C8                   INY                                  
4B32- 85 48                STA   $48                            
4B34- B1 40                LDA   (A3L),Y                        
4B36- 85 49                STA   $49                            
4B38- 4C 90 E0             JMP   $E090                          
4B3B- A0 00                LDY   #$00                           
4B3D- 2C AC FE             BIT   $FEAC                          
4B40- 30 03                BMI   L4B45                          
4B42- AC 97 BF             LDY   $BF97                          
4B45- A2 00     L4B45      LDX   #$00                           
4B47- 60                   RTS                                  
4B48- 20 97 E5             JSR   $E597                          
4B4B- B0 47                BCS   L4B94                          
4B4D- 20 9D EF             JSR   $EF9D                          
4B50- AD 87 FE             LDA   $FE87                          
4B53- D0 3D                BNE   L4B92                          
4B55- A9 00                LDA   #$00                           
4B57- 8D 84 FE             STA   SETNORM                        
4B5A- 8D 85 FE             STA   $FE85                          
4B5D- 20 5D E9             JSR   $E95D                          
4B60- 90 04                BCC   L4B66                          
4B62- C9 48                CMP   #$48                           
4B64- D0 2E                BNE   L4B94                          
4B66- AD 6D FE  L4B66      LDA   $FE6D                          
4B69- 29 80                AND   #$80                           
4B6B- D0 05                BNE   L4B72                          
4B6D- A9 4E                LDA   #$4E                           
4B6F- 20 09 BF             JSR   $BF09                          
4B72- AD 30 BF  L4B72      LDA   $BF30                          
4B75- 20 46 F4             JSR   $F446                          
4B78- B0 1A                BCS   L4B94                          
4B7A- AD 60 FE             LDA   $FE60                          
4B7D- 8D AF FE             STA   $FEAF                          
4B80- AD 61 FE             LDA   $FE61                          
4B83- 8D B0 FE             STA   $FEB0                          
4B86- AD 4F FE             LDA   $FE4F                          
4B89- 29 F0                AND   #$F0                           
4B8B- C9 40                CMP   #$40                           
4B8D- 90 07                BCC   L4B96                          
4B8F- 4C FD F9             JMP   $F9FD                          
4B92- A9 50     L4B92      LDA   #$50                           
4B94- 38        L4B94      SEC                                  
4B95- 60                   RTS                                  
4B96- 8D B1 FE  L4B96      STA   $FEB1                          
4B99- A2 05                LDX   #$05                           
4B9B- A9 00                LDA   #$00                           
4B9D- 9D B1 FE  L4B9D      STA   $FEB1,X                        
4BA0- CA                   DEX                                  
4BA1- D0 FA                BNE   L4B9D                          
4BA3- A9 02                LDA   #$02                           
4BA5- 8D B7 FE             STA   $FEB7                          
4BA8- EE E7 FE             INC   $FEE7                          
4BAB- 20 60 FA             JSR   $FA60                          
4BAE- CE E7 FE             DEC   $FEE7                          
4BB1- B0 0E                BCS   L4BC1                          
4BB3- AE B0 FE  L4BB3      LDX   $FEB0                          
4BB6- AD AF FE             LDA   $FEAF                          
4BB9- 20 1E EA             JSR   $EA1E                          
4BBC- B0 03                BCS   L4BC1                          
4BBE- 20 7A EB             JSR   $EB7A                          
4BC1- 48        L4BC1      PHA                                  
4BC2- A9 00                LDA   #$00                           
4BC4- 8D 4F FE             STA   $FE4F                          
4BC7- CD 43 FE             CMP   $FE43                          
4BCA- D0 03                BNE   L4BCF                          
4BCC- CE 44 FE             DEC   $FE44                          
4BCF- CE 43 FE  L4BCF      DEC   $FE43                          
4BD2- 20 E0 F9             JSR   $F9E0                          
4BD5- 20 B6 E4             JSR   $E4B6                          
4BD8- AA                   TAX                                  
4BD9- 68                   PLA                                  
4BDA- 90 01                BCC   L4BDD                          
4BDC- 8A                   TXA                                  
4BDD- C9 01     L4BDD      CMP   #$01                           
4BDF- 60                   RTS                                  
4BE0- AC 81 FE             LDY   $FE81                          
4BE3- AD B2 FE             LDA   $FEB2                          
4BE6- 79 14 D9             ADC   $D914,Y                        
4BE9- 99 14 D9             STA   $D914,Y                        
4BEC- AD B3 FE             LDA   $FEB3                          
4BEF- 79 15 D9             ADC   $D915,Y                        
4BF2- 99 15 D9             STA   $D915,Y                        
4BF5- A9 00                LDA   #$00                           
4BF7- 99 1C D9             STA   $D91C,Y                        
4BFA- 60                   RTS                                  
4BFB- 90 B6     L4BFB      BCC   L4BB3                          
4BFD- C9 D0                CMP   #$D0                           
4BFF- D0 48                BNE   L4C49                          
4C01- 20 47 EB             JSR   $EB47                          
4C04- B0 42                BCS   L4C48                          
4C06- AD 60 FE             LDA   $FE60                          
4C09- 85 46                STA   $46                            
4C0B- AD 61 FE             LDA   $FE61                          
4C0E- 85 47                STA   $47                            
4C10- 20 DD EB             JSR   $EBDD                          
4C13- B0 33                BCS   L4C48                          
4C15- AD 25 DC             LDA   $DC25                          
4C18- D0 05                BNE   L4C1F                          
4C1A- AD 26 DC             LDA   $DC26                          
4C1D- F0 05                BEQ   L4C24                          
4C1F- A9 4E     L4C1F      LDA   #$4E                           
4C21- 20 09 BF             JSR   $BF09                          
4C24- 8D 04 DC  L4C24      STA   $DC04                          
4C27- 20 D9 EB             JSR   $EBD9                          
4C2A- B0 1C                BCS   L4C48                          
4C2C- AD 02 DC  L4C2C      LDA   $DC02                          
4C2F- C9 01                CMP   #$01                           
4C31- AE 03 DC             LDX   $DC03                          
4C34- D0 02                BNE   L4C38                          
4C36- 90 C3                BCC   L4BFB                          
4C38- 20 1E EA  L4C38      JSR   $EA1E                          
4C3B- B0 0B                BCS   L4C48                          
4C3D- AD 02 DC             LDA   $DC02                          
4C40- AE 03 DC             LDX   $DC03                          
4C43- 20 CD EB             JSR   $EBCD                          
4C46- 90 E4                BCC   L4C2C                          
4C48- 60        L4C48      RTS                                  
4C49- A9 4A     L4C49      LDA   #$4A                           
4C4B- 20 09 BF             JSR   $BF09                          
4C4E- 48                   PHA                                  
4C4F- 98                   TYA                                  
4C50- 48                   PHA                                  
4C51- AC 82 FE             LDY   $FE82                          
4C54- B9 1C D8             LDA   $D81C,Y                        
4C57- 09 80                ORA   #$80                           
4C59- 99 1C D8             STA   $D81C,Y                        
4C5C- 68                   PLA                                  
4C5D- A8                   TAY                                  
4C5E- 68                   PLA                                  
4C5F- 60                   RTS                                  
4C60- AD B1 FE             LDA   $FEB1                          
4C63- C9 20                CMP   #$20                           
4C65- 90 0D                BCC   L4C74                          
4C67- C9 30                CMP   #$30                           
4C69- 90 0C                BCC   L4C77                          
4C6B- C9 40                CMP   #$40                           
4C6D- 90 0B                BCC   L4C7A                          
4C6F- A9 0C                LDA   #$0C                           
4C71- 20 0C BF             JSR   $BF0C                          
4C74- 4C 4A FB  L4C74      JMP   $FB4A                          
4C77- 4C 11 FB  L4C77      JMP   $FB11                          
4C7A- A9 80     L4C7A      LDA   #$80                           
4C7C- 8D B8 FE             STA   $FEB8                          
4C7F- 20 74 FB  L4C7F      JSR   $FB74                          
4C82- B0 5F                BCS   L4CE3                          
4C84- AC B8 FE             LDY   $FEB8                          
4C87- CC B4 FE             CPY   $FEB4                          
4C8A- F0 58                BEQ   L4CE4                          
4C8C- A2 07                LDX   #$07                           
4C8E- B9 00 DC  L4C8E      LDA   $DC00,Y                        
4C91- 9D BA FE             STA   $FEBA,X                        
4C94- 19 00 DD             ORA   $DD00,Y                        
4C97- F0 09                BEQ   L4CA2                          
4C99- B9 00 DD             LDA   $DD00,Y                        
4C9C- 9D C2 FE             STA   $FEC2,X                        
4C9F- CA                   DEX                                  
4CA0- 30 12                BMI   L4CB4                          
4CA2- 88        L4CA2      DEY                                  
4CA3- CC B4 FE             CPY   $FEB4                          
4CA6- D0 E6                BNE   L4C8E                          
4CA8- C8                   INY                                  
4CA9- A9 00                LDA   #$00                           
4CAB- 9D BA FE  L4CAB      STA   $FEBA,X                        
4CAE- 9D C2 FE             STA   $FEC2,X                        
4CB1- CA                   DEX                                  
4CB2- 10 F7                BPL   L4CAB                          
4CB4- 88        L4CB4      DEY                                  
4CB5- 8C B8 FE             STY   $FEB8                          
4CB8- A2 07                LDX   #$07                           
4CBA- 8E B9 FE  L4CBA      STX   $FEB9                          
4CBD- BD BA FE             LDA   $FEBA,X                        
4CC0- 85 46                STA   $46                            
4CC2- 1D C2 FE             ORA   $FEC2,X                        
4CC5- F0 B8                BEQ   L4C7F                          
4CC7- BD C2 FE             LDA   $FEC2,X                        
4CCA- 85 47                STA   $47                            
4CCC- 20 DD EB             JSR   $EBDD                          
4CCF- B0 12                BCS   L4CE3                          
4CD1- 20 AF FB             JSR   $FBAF                          
4CD4- B0 0D                BCS   L4CE3                          
4CD6- 20 D9 EB             JSR   $EBD9                          
4CD9- B0 08                BCS   L4CE3                          
4CDB- AE B9 FE             LDX   $FEB9                          
4CDE- CA                   DEX                                  
4CDF- 10 D9                BPL   L4CBA                          
4CE1- 30 9C                BMI   L4C7F                          
4CE3- 60        L4CE3      RTS                                  
4CE4- AC B4 FE  L4CE4      LDY   $FEB4                          
4CE7- C8                   INY                                  
4CE8- 20 B1 FB             JSR   $FBB1                          
4CEB- B0 F6                BCS   L4CE3                          
4CED- 20 D9 EB             JSR   $EBD9                          
4CF0- B0 F1                BCS   L4CE3                          
4CF2- AC B4 FE             LDY   $FEB4                          
4CF5- F0 15                BEQ   L4D0C                          
4CF7- B9 00 DC             LDA   $DC00,Y                        
4CFA- 85 46                STA   $46                            
4CFC- 19 00 DD             ORA   $DD00,Y                        
4CFF- F0 E2                BEQ   L4CE3                          
4D01- B9 00 DD             LDA   $DD00,Y                        
4D04- 85 47                STA   $47                            
4D06- 20 DD EB             JSR   $EBDD                          
4D09- 90 0B                BCC   L4D16                          
4D0B- 60                   RTS                                  
4D0C- 20 7D FB  L4D0C      JSR   $FB7D                          
4D0F- B0 D2                BCS   L4CE3                          
4D11- 20 74 FB             JSR   $FB74                          
4D14- B0 CD                BCS   L4CE3                          
4D16- AC B5 FE  L4D16      LDY   $FEB5                          
4D19- C8                   INY                                  
4D1A- F0 0A                BEQ   L4D26                          
4D1C- 20 B1 FB             JSR   $FBB1                          
4D1F- B0 C2                BCS   L4CE3                          
4D21- 20 D9 EB             JSR   $EBD9                          
4D24- B0 BD                BCS   L4CE3                          
4D26- AC B5 FE  L4D26      LDY   $FEB5                          
4D29- F0 15                BEQ   L4D40                          
4D2B- B9 00 DC  L4D2B      LDA   $DC00,Y                        
4D2E- 85 46                STA   $46                            
4D30- 19 00 DD             ORA   $DD00,Y                        
4D33- F0 AE                BEQ   L4CE3                          
4D35- B9 00 DD             LDA   $DD00,Y                        
4D38- 85 47                STA   $47                            
4D3A- 20 DD EB             JSR   $EBDD                          
4D3D- 90 10                BCC   L4D4F                          
4D3F- 60                   RTS                                  
4D40- AD B4 FE  L4D40      LDA   $FEB4                          
4D43- D0 E6                BNE   L4D2B                          
4D45- 20 7D FB             JSR   $FB7D                          
4D48- B0 29                BCS   L4D73                          
4D4A- 20 74 FB             JSR   $FB74                          
4D4D- B0 24                BCS   L4D73                          
4D4F- AC B7 FE  L4D4F      LDY   $FEB7                          
4D52- F0 06                BEQ   L4D5A                          
4D54- 88                   DEY                                  
4D55- D0 1C                BNE   L4D73                          
4D57- AC B6 FE             LDY   $FEB6                          
4D5A- A9 00     L4D5A      LDA   #$00                           
4D5C- 99 00 DD  L4D5C      STA   $DD00,Y                        
4D5F- C8                   INY                                  
4D60- D0 FA                BNE   L4D5C                          
4D62- AC B7 FE             LDY   $FEB7                          
4D65- D0 09                BNE   L4D70                          
4D67- AC B6 FE             LDY   $FEB6                          
4D6A- 99 00 DC  L4D6A      STA   $DC00,Y                        
4D6D- C8                   INY                                  
4D6E- D0 FA                BNE   L4D6A                          
4D70- 4C D9 EB  L4D70      JMP   $EBD9                          
4D73- 60        L4D73      RTS                                  
4D74- AD AF FE             LDA   $FEAF                          
4D77- AE B0 FE             LDX   $FEB0                          
4D7A- 4C CD EB             JMP   $EBCD                          
4D7D- AE B0 FE             LDX   $FEB0                          
4D80- 8A                   TXA                                  
4D81- 48                   PHA                                  
4D82- AD AF FE             LDA   $FEAF                          
4D85- 48                   PHA                                  
4D86- 20 1E EA             JSR   $EA1E                          
4D89- 68                   PLA                                  
4D8A- 85 46                STA   $46                            
4D8C- 68                   PLA                                  
4D8D- 85 47                STA   $47                            
4D8F- B0 1D                BCS   L4DAE                          
4D91- AD 00 DC             LDA   $DC00                          
4D94- 8D AF FE             STA   $FEAF                          
4D97- AD 00 DD             LDA   $DD00                          
4D9A- 8D B0 FE             STA   $FEB0                          
4D9D- A0 00                LDY   #$00                           
4D9F- 20 DE FB             JSR   $FBDE                          
4DA2- 38                   SEC                                  
4DA3- AD B1 FE             LDA   $FEB1                          
4DA6- E9 10                SBC   #$10                           
4DA8- 8D B1 FE             STA   $FEB1                          
4DAB- 20 D9 EB             JSR   $EBD9                          
4DAE- 60        L4DAE      RTS                                  
4DAF- A0 00                LDY   #$00                           
4DB1- A5 46                LDA   $46                            
4DB3- 48                   PHA                                  
4DB4- A5 47                LDA   $47                            
4DB6- 48                   PHA                                  
4DB7- 8C 8D FE  L4DB7      STY   $FE8D                          
4DBA- B9 00 DC             LDA   $DC00,Y                        
4DBD- C9 01                CMP   #$01                           
4DBF- BE 00 DD             LDX   $DD00,Y                        
4DC2- D0 02                BNE   L4DC6                          
4DC4- 90 0B                BCC   L4DD1                          
4DC6- 20 1E EA  L4DC6      JSR   $EA1E                          
4DC9- B0 0A                BCS   L4DD5                          
4DCB- AC 8D FE             LDY   $FE8D                          
4DCE- 20 DE FB             JSR   $FBDE                          
4DD1- C8        L4DD1      INY                                  
4DD2- D0 E3                BNE   L4DB7                          
4DD4- 18                   CLC                                  
4DD5- AA        L4DD5      TAX                                  
4DD6- 68                   PLA                                  
4DD7- 85 47                STA   $47                            
4DD9- 68                   PLA                                  
4DDA- 85 46                STA   $46                            
4DDC- 8A                   TXA                                  
4DDD- 60                   RTS                                  
4DDE- AD E7 FE             LDA   $FEE7                          
4DE1- D0 03                BNE   L4DE6                          
4DE3- AA                   TAX                                  
4DE4- F0 06                BEQ   L4DEC                          
4DE6- BE 00 DD  L4DE6      LDX   $DD00,Y                        
4DE9- B9 00 DC             LDA   $DC00,Y                        
4DEC- 99 00 DD  L4DEC      STA   $DD00,Y                        
4DEF- 8A                   TXA                                  
4DF0- 99 00 DC             STA   $DC00,Y                        
4DF3- 60                   RTS                                  
4DF4- A0 04                LDY   #$04                           
4DF6- B1 40                LDA   (A3L),Y                        
4DF8- AA                   TAX                                  
4DF9- C9 08                CMP   #$08                           
4DFB- 90 42                BCC   L4E3F                          
4DFD- C9 BC                CMP   #$BC                           
4DFF- B0 3E                BCS   L4E3F                          
4E01- 85 4B                STA   $4B                            
4E03- 88                   DEY                                  
4E04- B1 40                LDA   (A3L),Y                        
4E06- 85 4A                STA   $4A                            
4E08- D0 35                BNE   L4E3F                          
4E0A- E8                   INX                                  
4E0B- E8                   INX                                  
4E0C- E8                   INX                                  
4E0D- E8                   INX                                  
4E0E- CA        L4E0E      DEX                                  
4E0F- 20 7A FC             JSR   $FC7A                          
4E12- 39 58 BF             AND   $BF58,Y                        
4E15- D0 28                BNE   L4E3F                          
4E17- E4 4B                CPX   $4B                            
4E19- D0 F3                BNE   L4E0E                          
4E1B- E8                   INX                                  
4E1C- E8                   INX                                  
4E1D- E8                   INX                                  
4E1E- E8                   INX                                  
4E1F- CA        L4E1F      DEX                                  
4E20- 20 7A FC             JSR   $FC7A                          
4E23- 19 58 BF             ORA   $BF58,Y                        
4E26- 99 58 BF             STA   $BF58,Y                        
4E29- E4 4B                CPX   $4B                            
4E2B- D0 F2                BNE   L4E1F                          
4E2D- AC 82 FE  L4E2D      LDY   $FE82                          
4E30- B9 00 D8             LDA   $D800,Y                        
4E33- 0A                   ASL                                  
4E34- 99 0B D8             STA   $D80B,Y                        
4E37- AA                   TAX                                  
4E38- A5 4B                LDA   $4B                            
4E3A- 9D 6F BF             STA   $BF6F,X                        
4E3D- 18                   CLC                                  
4E3E- 60                   RTS                                  
4E3F- A9 56     L4E3F      LDA   #$56                           
4E41- 38                   SEC                                  
4E42- 60                   RTS                                  
4E43- AA                   TAX                                  
4E44- BD 6E BF             LDA   $BF6E,X                        
4E47- 8D CD FE             STA   $FECD                          
4E4A- BD 6F BF             LDA   $BF6F,X                        
4E4D- 8D CE FE             STA   $FECE                          
4E50- 60                   RTS                                  
4E51- 20 43 FC             JSR   $FC43                          
4E54- 09 00                ORA   #$00                           
4E56- F0 20                BEQ   L4E78                          
4E58- A9 00                LDA   #$00                           
4E5A- 9D 6F BF             STA   $BF6F,X                        
4E5D- 9D 6E BF             STA   $BF6E,X                        
4E60- AE CE FE             LDX   $FECE                          
4E63- E8                   INX                                  
4E64- E8                   INX                                  
4E65- E8                   INX                                  
4E66- E8                   INX                                  
4E67- CA        L4E67      DEX                                  
4E68- 20 7A FC             JSR   $FC7A                          
4E6B- 49 FF                EOR   #$FF                           
4E6D- 39 58 BF             AND   $BF58,Y                        
4E70- 99 58 BF             STA   $BF58,Y                        
4E73- EC CE FE             CPX   $FECE                          
4E76- D0 EF                BNE   L4E67                          
4E78- 18        L4E78      CLC                                  
4E79- 60                   RTS                                  
4E7A- 8A                   TXA                                  
4E7B- 29 07                AND   #$07                           
4E7D- A8                   TAY                                  
4E7E- B9 04 FE             LDA   $FE04,Y                        
4E81- 48                   PHA                                  
4E82- 8A                   TXA                                  
4E83- 4A                   LSR                                  
4E84- 4A                   LSR                                  
4E85- 4A                   LSR                                  
4E86- A8                   TAY                                  
4E87- 68                   PLA                                  
4E88- 60                   RTS                                  
4E89- A5 4F                LDA   RNDH                           
4E8B- C9 02                CMP   #$02                           
4E8D- 90 B0                BCC   L4E3F                          
4E8F- AE CB FE             LDX   $FECB                          
4E92- AD CA FE             LDA   $FECA                          
4E95- E9 01                SBC   #$01                           
4E97- B0 01                BCS   L4E9A                          
4E99- CA                   DEX                                  
4E9A- 18        L4E9A      CLC                                  
4E9B- 65 4E                ADC   RNDL                           
4E9D- 8A                   TXA                                  
4E9E- 65 4F                ADC   RNDH                           
4EA0- AA                   TAX                                  
4EA1- E0 BF                CPX   #$BF                           
4EA3- B0 9A                BCS   L4E3F                          
4EA5- E8                   INX                                  
4EA6- CA        L4EA6      DEX                                  
4EA7- 20 7A FC             JSR   $FC7A                          
4EAA- 39 58 BF             AND   $BF58,Y                        
4EAD- D0 90                BNE   L4E3F                          
4EAF- E4 4F                CPX   RNDH                           
4EB1- D0 F3                BNE   L4EA6                          
4EB3- 18                   CLC                                  
4EB4- 60                   RTS                                  
4EB5- A0 02                LDY   #$02                           
4EB7- AD CD FE             LDA   $FECD                          
4EBA- 91 40                STA   (A3L),Y                        
4EBC- C8                   INY                                  
4EBD- AD CE FE             LDA   $FECE                          
4EC0- 91 40                STA   (A3L),Y                        
4EC2- 18                   CLC                                  
4EC3- 60                   RTS                                  
4EC4- A0 03                LDY   #$03                           
4EC6- 20 F6 FB             JSR   $FBF6                          
4EC9- B0 20                BCS   L4EEB                          
4ECB- AD CE FE             LDA   $FECE                          
4ECE- 85 4F                STA   RNDH                           
4ED0- AD CD FE             LDA   $FECD                          
4ED3- 85 4E                STA   RNDL                           
4ED5- 20 60 FC             JSR   $FC60                          
4ED8- A0 00                LDY   #$00                           
4EDA- A2 03                LDX   #$03                           
4EDC- B1 4E     L4EDC      LDA   (RNDL),Y                       
4EDE- 91 4A                STA   ($4A),Y                        
4EE0- C8                   INY                                  
4EE1- D0 F9                BNE   L4EDC                          
4EE3- E6 4B                INC   $4B                            
4EE5- E6 4F                INC   RNDH                           
4EE7- CA                   DEX                                  
4EE8- 10 F2                BPL   L4EDC                          
4EEA- 18                   CLC                                  
4EEB- 60        L4EEB      RTS                                  
4EEC- AD 83 C0             LDA   PHASE1ON                       
4EEF- AD 83 C0             LDA   PHASE1ON                       
4EF2- A0 03                LDY   #$03                           
4EF4- B9 00 00  L4EF4      LDA   $0000,Y                        
4EF7- 48                   PHA                                  
4EF8- 88                   DEY                                  
4EF9- 10 F9                BPL   L4EF4                          
4EFB- A9 10     L4EFB      LDA   #$10                           
4EFD- 85 03                STA   $03                            
4EFF- A9 D1                LDA   #$D1                           
4F01- 85 01                STA   $01                            
4F03- A9 00                LDA   #$00                           
4F05- 85 00                STA   $00                            
4F07- 85 02                STA   $02                            
4F09- A8                   TAY                                  
4F0A- A2 03                LDX   #$03                           
4F0C- 88        L4F0C      DEY                                  
4F0D- B1 00                LDA   ($00),Y                        
4F0F- 91 02                STA   ($02),Y                        
4F11- 98                   TYA                                  
4F12- D0 F8                BNE   L4F0C                          
4F14- E6 01                INC   $01                            
4F16- E6 03                INC   $03                            
4F18- CA                   DEX                                  
4F19- D0 F1                BNE   L4F0C                          
4F1B- 68        L4F1B      PLA                                  
4F1C- 95 00                STA   $00,X                          
4F1E- E8                   INX                                  
4F1F- E0 04                CPX   #$04                           
4F21- 90 F8                BCC   L4F1B                          
4F23- EA                   NOP                                  
4F24- AD 8B C0             LDA   DRV1EN                         
4F27- AD 8B C0             LDA   DRV1EN                         
4F2A- A9 69                LDA   #$69                           
4F2C- 8D F2 03             STA   DOSRESET                       
4F2F- A9 FF                LDA   #$FF                           
4F31- 8D F3 03             STA   $03F3                          
4F34- 49 A5                EOR   #$A5                           
4F36- 8D F4 03             STA   $03F4                          
4F39- 4C 00 10             JMP   $1000                          
4F3C- 08                   PHP                                  
4F3D- 68                   PLA                                  
4F3E- 48                   PHA                                  
4F3F- B8                   CLV                                  
4F40- 29 04                AND   #$04                           
4F42- F0 03                BEQ   L4F47                          
4F44- 2C 65 FD             BIT   $FD65                          
4F47- 78        L4F47      SEI                                  
4F48- AD 83 C0             LDA   PHASE1ON                       
4F4B- AD 83 C0             LDA   PHASE1ON                       
4F4E- 38                   SEC                                  
4F4F- A2 05                LDX   #$05                           
4F51- 20 D6 03             JSR   DOSFM                          
4F54- 8D 0F BF             STA   $BF0F                          
4F57- AD 8B C0             LDA   DRV1EN                         
4F5A- AD 8B C0             LDA   DRV1EN                         
4F5D- 28                   PLP                                  
4F5E- 18                   CLC                                  
4F5F- AD 0F BF             LDA   $BF0F                          
4F62- F0 01                BEQ   L4F65                          
4F64- 38                   SEC                                  
4F65- 60        L4F65      RTS                                  
4F66- 8D 83 C0             STA   PHASE1ON                       
4F69- 20 00 D4             JSR   $D400                          
4F6C- 8D 8B C0             STA   DRV1EN                         
4F6F- 60                   RTS                                  
4F70- D3                   ???                                  
4F71- 00                   BRK                                  
4F72- 00                   BRK                                  
4F73- 00                   BRK                                  
4F74- 40                   RTI                                  
4F75- 41 00                EOR   ($00,X)                        
4F77- 00                   BRK                                  
4F78- 80 81                BRA   L4EFB                          
4F7A- 82 65                ???   $65                            
4F7C- C0 C1                CPY   #$C1                           
4F7E- C2 C3                ???   $C3                            
4F80- C4 C5                CPY   $C5                            
4F82- C6 C7                DEC   $C7                            
4F84- C8                   INY                                  
4F85- C9 CA                CMP   #$CA                           
4F87- CB CC                ???   #$CC                           
4F89- CD CE CF             CMP   $CFCE                          
4F8C- 00                   BRK                                  
4F8D- D0 D1                BNE   L4F60                          
4F8F- D2 02                CMP   ($02)                          
4F91- FF FF                ???   L4F92                          
4F93- FF 02                ???   L4F97                          
4F95- 01 FF                ORA   ($FF,X)                        
4F97- FF 03     L4F97      ???   L4F9C                          
4F99- 03                   ???                                  
4F9A- 00                   BRK                                  
4F9B- 04 07                TSB   $07                            
4F9D- 01 02                ORA   ($02,X)                        
4F9F- 07 0A                ???   $0A                            
4FA1- 02 01                ???   $01                            
4FA3- 01 03                ORA   ($03,X)                        
4FA5- 03                   ???                                  
4FA6- 04 04                TSB   $04                            
4FA8- 01 01                ORA   ($01,X)                        
4FAA- 02 02                ???   $02                            
4FAC- FF 02                ???   L4FB0                          
4FAE- 02 02                ???   $02                            
4FB0- 08        L4FB0      PHP                                  
4FB1- E3                   ???                                  
4FB2- 48                   PHA                                  
4FB3- F9 07 F8             SBC   $F807,Y                        
4FB6- D0 F7                BNE   L4FAF                          
4FB8- 6B                   ???                                  
4FB9- F7 30                ???   COLOR                          
4FBB- E2 30                ???   COLOR                          
4FBD- E1 88                SBC   ($88,X)                        
4FBF- E1 B7                SBC   ($B7,X)                        
4FC1- EE 59 F7             INC   $F759                          
4FC4- EB                   ???                                  
4FC5- EF 70                ???   L5037                          
4FC7- F2 6D                SBC   ($6D)                          
4FC9- F4 DC                ???   $DC                            
4FCB- F4 19                ???   $19                            
4FCD- EC 03 EC             CPX   $EC03                          
4FD0- F4 F5                ???   $F5                            
4FD2- 47 F7                ???   $F7                            
4FD4- C4 FC                CPY   $FC                            
4FD6- B5 FC                LDA   $FC,X                          
4FD8- A0 A1                LDY   #$A1                           
4FDA- A2 A3                LDX   #$A3                           
4FDC- 84 05                STY   $05                            
4FDE- 06 07                ASL   $07                            
4FE0- 88                   DEY                                  
4FE1- 49 4A                EOR   #$4A                           
4FE3- 4B                   ???                                  
4FE4- 2C 2D 4E             BIT   L4E2D                          
4FE7- 4F 50                ???   L5039                          
4FE9- 51 52                EOR   ($52),Y                        
4FEB- 53                   ???                                  
4FEC- 01 00                ORA   ($00,X)                        
4FEE- 00                   BRK                                  
4FEF- 02 00                ???   $00                            
4FF1- 75 00                ADC   $00,X                          
4FF3- 00                   BRK                                  
4FF4- 00                   BRK                                  
4FF5- 00                   BRK                                  
4FF6- C3                   ???                                  
4FF7- 27 0D                ???   $0D                            
4FF9- 00                   BRK                                  
4FFA- 00                   BRK                                  
4FFB- 00                   BRK                                  
4FFC- 0F 02                ???   L5000                          
4FFE- 00                   BRK                                  
4FFF- 04 00                TSB   $00                            
5001- 00                   BRK                                  
5002- 08                   PHP                                  
5003- 00                   BRK                                  
5004- 80 40                BRA   L5046                          
5006- 20 10 08             JSR   $0810                          
5009- 04 02                TSB   $02                            
500B- 01 0C                ORA   ($0C,X)                        
500D- 0D 18 19             ORA   $1918                          
5010- 15 16                ORA   $16,X                          
5012- 17 1E                ???   $1E                            
5014- 10 1F                BPL   L5035                          
5016- 20 80 93             JSR   $9380                          
5019- 94 21                STY   WNDWDTH,X                      
501B- 22 23                ???   WNDBTM                         
501D- 24 18                BIT   $18                            
501F- 19 1A 1B             ORA   $1B1A,Y                        
5022- A0 D2                LDY   #$D2                           
5024- C5 D3                CMP   $D3                            
5026- D4 C1                ???   $C1                            
5028- D2 D4                CMP   ($D4)                          
502A- A0 D3                LDY   #$D3                           
502C- D9 D3 D4             CMP   $D4D3,Y                        
502F- C5 CD                CMP   $CD                            
5031- A0 A0                LDY   #$A0                           
5033- A0 A0                LDY   #$A0                           
5035- 00        L5035      BRK                                  
5036- 00                   BRK                                  
5037- 00        L5037      BRK                                  
5038- 00                   BRK                                  
5039- 00        L5039      BRK                                  
503A- 00                   BRK                                  
503B- 00                   BRK                                  
503C- 00                   BRK                                  
503D- 00                   BRK                                  
503E- 00                   BRK                                  
503F- 00                   BRK                                  
5040- 00                   BRK                                  
5041- 00                   BRK                                  
5042- 00                   BRK                                  
5043- 00                   BRK                                  
5044- 00                   BRK                                  
5045- 00                   BRK                                  
5046- 00        L5046      BRK                                  
5047- 00                   BRK                                  
5048- 00                   BRK                                  
5049- 00                   BRK                                  
504A- 00                   BRK                                  
504B- 00                   BRK                                  
504C- 00                   BRK                                  
504D- 00                   BRK                                  
504E- 00                   BRK                                  
504F- 00                   BRK                                  
5050- 00                   BRK                                  
5051- 00                   BRK                                  
5052- 00                   BRK                                  
5053- 00                   BRK                                  
5054- 00                   BRK                                  
5055- 00                   BRK                                  
5056- 00                   BRK                                  
5057- 00                   BRK                                  
5058- 00                   BRK                                  
5059- 00                   BRK                                  
505A- 00                   BRK                                  
505B- 00                   BRK                                  
505C- 00                   BRK                                  
505D- 00                   BRK                                  
505E- 00                   BRK                                  
505F- 00                   BRK                                  
5060- 00                   BRK                                  
5061- 00                   BRK                                  
5062- 00                   BRK                                  
5063- 00                   BRK                                  
5064- 00                   BRK                                  
5065- 00                   BRK                                  
5066- 00                   BRK                                  
5067- 00                   BRK                                  
5068- 00                   BRK                                  
5069- 00                   BRK                                  
506A- 00                   BRK                                  
506B- 00                   BRK                                  
506C- 00                   BRK                                  
506D- 00                   BRK                                  
506E- 00                   BRK                                  
506F- 00                   BRK                                  
5070- 00                   BRK                                  
5071- 00                   BRK                                  
5072- 00                   BRK                                  
5073- 00                   BRK                                  
5074- 00                   BRK                                  
5075- 00                   BRK                                  
5076- 00                   BRK                                  
5077- 00                   BRK                                  
5078- 00                   BRK                                  
5079- 00                   BRK                                  
507A- 00                   BRK                                  
507B- 00                   BRK                                  
507C- 00                   BRK                                  
507D- 00                   BRK                                  
507E- 00                   BRK                                  
507F- 00                   BRK                                  
5080- 00                   BRK                                  
5081- 00                   BRK                                  
5082- 00                   BRK                                  
5083- 00                   BRK                                  
5084- 00                   BRK                                  
5085- 00                   BRK                                  
5086- 00                   BRK                                  
5087- 00                   BRK                                  
5088- 00                   BRK                                  
5089- 00                   BRK                                  
508A- 00                   BRK                                  
508B- 00                   BRK                                  
508C- 00                   BRK                                  
508D- 00                   BRK                                  
508E- 00                   BRK                                  
508F- 00                   BRK                                  
5090- 00                   BRK                                  
5091- 00                   BRK                                  
5092- 00                   BRK                                  
5093- 00                   BRK                                  
5094- 00                   BRK                                  
5095- 00                   BRK                                  
5096- 00                   BRK                                  
5097- 00                   BRK                                  
5098- 00                   BRK                                  
5099- 00                   BRK                                  
509A- 00                   BRK                                  
509B- 00                   BRK                                  
509C- 00                   BRK                                  
509D- 00                   BRK                                  
509E- 00                   BRK                                  
509F- 00                   BRK                                  
50A0- 00                   BRK                                  
50A1- 00                   BRK                                  
50A2- 00                   BRK                                  
50A3- 00                   BRK                                  
50A4- 00                   BRK                                  
50A5- 00                   BRK                                  
50A6- 00                   BRK                                  
50A7- 00                   BRK                                  
50A8- 00                   BRK                                  
50A9- 00                   BRK                                  
50AA- 00                   BRK                                  
50AB- 00                   BRK                                  
50AC- 00                   BRK                                  
50AD- 00                   BRK                                  
50AE- 00                   BRK                                  
50AF- 00                   BRK                                  
50B0- 00                   BRK                                  
50B1- 00                   BRK                                  
50B2- 00                   BRK                                  
50B3- 00                   BRK                                  
50B4- 00                   BRK                                  
50B5- 00                   BRK                                  
50B6- 00                   BRK                                  
50B7- 00                   BRK                                  
50B8- 00                   BRK                                  
50B9- 00                   BRK                                  
50BA- 00                   BRK                                  
50BB- 00                   BRK                                  
50BC- 00                   BRK                                  
50BD- 00                   BRK                                  
50BE- 00                   BRK                                  
50BF- 00                   BRK                                  
50C0- 00                   BRK                                  
50C1- 00                   BRK                                  
50C2- 00                   BRK                                  
50C3- 00                   BRK                                  
50C4- 00                   BRK                                  
50C5- 00                   BRK                                  
50C6- 00                   BRK                                  
50C7- 00                   BRK                                  
50C8- 00                   BRK                                  
50C9- 00                   BRK                                  
50CA- 00                   BRK                                  
50CB- 00                   BRK                                  
50CC- 00                   BRK                                  
50CD- 00                   BRK                                  
50CE- 00                   BRK                                  
50CF- 00                   BRK                                  
50D0- 00                   BRK                                  
50D1- 00                   BRK                                  
50D2- 00                   BRK                                  
50D3- 00                   BRK                                  
50D4- 00                   BRK                                  
50D5- 00                   BRK                                  
50D6- 00                   BRK                                  
50D7- 00                   BRK                                  
50D8- 00                   BRK                                  
50D9- 00                   BRK                                  
50DA- 00                   BRK                                  
50DB- 00                   BRK                                  
50DC- 00                   BRK                                  
50DD- 00                   BRK                                  
50DE- 00                   BRK                                  
50DF- 00                   BRK                                  
50E0- 00                   BRK                                  
50E1- 00                   BRK                                  
50E2- 00                   BRK                                  
50E3- 00                   BRK                                  
50E4- 00                   BRK                                  
50E5- 00                   BRK                                  
50E6- 00                   BRK                                  
50E7- 00                   BRK                                  
50E8- 28                   PLP                                  
50E9- 43                   ???                                  
50EA- 29 31                AND   #$31                           
50EC- 39 38 33             AND   L3338,Y                        
50EF- 2D 38 39             AND   L3938                          
50F2- 41 50                EOR   ($50,X)                        
50F4- 50 4C                BVC   L5142                          
50F6- 45 00                EOR   $00                            
50F8- 00                   BRK                                  
50F9- 00                   BRK                                  
50FA- 00                   BRK                                  
50FB- 00                   BRK                                  
50FC- 00                   BRK                                  
50FD- EC FC 00             CPX   $00FC                          
5100- 4C 4B BF             JMP   $BF4B                          
5103- 4C 03 BF             JMP   $BF03                          
5106- 60                   RTS                                  
5107- 42 D7                ???   $D7                            
5109- 4C 03 E0             JMP   $E003                          
510C- 4C 0D E0             JMP   $E00D                          
510F- 00                   BRK                                  
5110- AC DE AC             LDY   $ACDE                          
5113- DE AC DE             DEC   $DEAC,X                        
5116- AC DE AC             LDY   $ACDE                          
5119- DE AC DE             DEC   $DEAC,X                        
511C- AC DE AC             LDY   $ACDE                          
511F- DE AC DE             DEC   $DEAC,X                        
5122- AC DE AC             LDY   $ACDE                          
5125- DE AC DE             DEC   $DEAC,X                        
5128- AC DE AC             LDY   $ACDE                          
512B- DE AC DE             DEC   $DEAC,X                        
512E- AC DE 00             LDY   $00DE                          
5131- FF 00                ???   L5133                          
5133- 00        L5133      BRK                                  
5134- 00                   BRK                                  
5135- 00                   BRK                                  
5136- 00                   BRK                                  
5137- 00                   BRK                                  
5138- 00                   BRK                                  
5139- 00                   BRK                                  
513A- 00                   BRK                                  
513B- 00                   BRK                                  
513C- 00                   BRK                                  
513D- 00                   BRK                                  
513E- 00                   BRK                                  
513F- 00                   BRK                                  
5140- 28                   PLP                                  
5141- 43                   ???                                  
5142- 29 41     L5142      AND   #$41                           
5144- 50 50                BVC   L5196                          
5146- 4C 45 27             JMP   L2745                          
5149- 38                   SEC                                  
514A- 33                   ???                                  
514B- 08                   PHP                                  
514C- 78                   SEI                                  
514D- 4C B7 BF             JMP   $BFB7                          
5150- 8D 8B C0             STA   DRV1EN                         
5153- 4C D8 FF             JMP   $FFD8                          
5156- 00                   BRK                                  
5157- 00                   BRK                                  
5158- C0 00                CPY   #$00                           
515A- 00                   BRK                                  
515B- 00                   BRK                                  
515C- 00                   BRK                                  
515D- 00                   BRK                                  
515E- 00                   BRK                                  
515F- 00                   BRK                                  
5160- 00                   BRK                                  
5161- 00                   BRK                                  
5162- 00                   BRK                                  
5163- 00                   BRK                                  
5164- 00                   BRK                                  
5165- 00                   BRK                                  
5166- 00                   BRK                                  
5167- 00                   BRK                                  
5168- 00                   BRK                                  
5169- 00                   BRK                                  
516A- 00                   BRK                                  
516B- 00                   BRK                                  
516C- 00                   BRK                                  
516D- 00                   BRK                                  
516E- 00                   BRK                                  
516F- 01 00                ORA   ($00,X)                        
5171- 00                   BRK                                  
5172- 00                   BRK                                  
5173- 00                   BRK                                  
5174- 00                   BRK                                  
5175- 00                   BRK                                  
5176- 00                   BRK                                  
5177- 00                   BRK                                  
5178- 00                   BRK                                  
5179- 00                   BRK                                  
517A- 00                   BRK                                  
517B- 00                   BRK                                  
517C- 00                   BRK                                  
517D- 00                   BRK                                  
517E- 00                   BRK                                  
517F- 00                   BRK                                  
5180- 00                   BRK                                  
5181- 00                   BRK                                  
5182- 00                   BRK                                  
5183- 00                   BRK                                  
5184- 00                   BRK                                  
5185- 00                   BRK                                  
5186- 00                   BRK                                  
5187- 00                   BRK                                  
5188- 00                   BRK                                  
5189- 00                   BRK                                  
518A- 00                   BRK                                  
518B- 00                   BRK                                  
518C- 00                   BRK                                  
518D- 01 00                ORA   ($00,X)                        
518F- 00                   BRK                                  
5190- 00                   BRK                                  
5191- 00                   BRK                                  
5192- 00                   BRK                                  
5193- 00                   BRK                                  
5194- 00                   BRK                                  
5195- 00                   BRK                                  
5196- 00        L5196      BRK                                  
5197- 00                   BRK                                  
5198- 00                   BRK                                  
5199- 00                   BRK                                  
519A- 00                   BRK                                  
519B- 00                   BRK                                  
519C- 00                   BRK                                  
519D- 00                   BRK                                  
519E- 00                   BRK                                  
519F- 00                   BRK                                  
51A0- 4D 00 E0             EOR   $E000                          
51A3- F0 05                BEQ   L51AA                          
51A5- 8D 82 C0             STA   PHASE1OFF                      
51A8- D0 0B                BNE   L51B5                          
51AA- AD F5 BF  L51AA      LDA   $BFF5                          
51AD- 4D 00 D0             EOR   $D000                          
51B0- F0 03                BEQ   L51B5                          
51B2- AD 83 C0             LDA   PHASE1ON                       
51B5- 68        L51B5      PLA                                  
51B6- 40                   RTI                                  
51B7- 38                   SEC                                  
51B8- 6E 9B BF             ROR   $BF9B                          
51BB- AD 00 E0             LDA   $E000                          
51BE- 8D F4 BF             STA   $BFF4                          
51C1- AD 00 D0             LDA   $D000                          
51C4- 8D F5 BF             STA   $BFF5                          
51C7- AD 8B C0             LDA   DRV1EN                         
51CA- AD 8B C0             LDA   DRV1EN                         
51CD- 4C 00 DE             JMP   $DE00                          
51D0- AD 8D BF             LDA   $BF8D                          
51D3- F0 0D                BEQ   L51E2                          
51D5- 30 08                BMI   L51DF                          
51D7- 4A                   LSR                                  
51D8- 90 0D                BCC   L51E7                          
51DA- AD 81 C0             LDA   PHASEON                        
51DD- B0 08                BCS   L51E7                          
51DF- AD 83 C0  L51DF      LDA   PHASE1ON                       
51E2- A9 01     L51E2      LDA   #$01                           
51E4- 8D 8D BF             STA   $BF8D                          
51E7- AD 88 BF  L51E7      LDA   $BF88                          
51EA- 40                   RTI                                  
51EB- 2C 8B C0             BIT   DRV1EN                         
51EE- 2C 8B C0             BIT   DRV1EN                         
51F1- 4C 52 DF             JMP   $DF52                          
51F4- 00                   BRK                                  
51F5- 00                   BRK                                  
51F6- 00                   BRK                                  
51F7- 00                   BRK                                  
51F8- 00                   BRK                                  
51F9- 00                   BRK                                  
51FA- 03                   ???                                  
51FB- 00                   BRK                                  
51FC- 00                   BRK                                  
51FD- 00                   BRK                                  
51FE- 00                   BRK                                  
51FF- 08                   PHP                                  
5200- AE 50 D7             LDX   $D750                          
5203- BD 38 05             LDA   $0538,X                        
5206- 48                   PHA                                  
5207- A9 A3                LDA   #$A3                           
5209- 20 0B C1             JSR   $C10B                          
520C- 20 08 C1             JSR   $C108                          
520F- 18                   CLC                                  
5210- A2 04                LDX   #$04                           
5212- A0 0C                LDY   #$0C                           
5214- B9 00 02  L5214      LDA   $0200,Y                        
5217- 29 07                AND   #$07                           
5219- 85 3A                STA   PCL                            
521B- 0A                   ASL                                  
521C- 0A                   ASL                                  
521D- 65 3A                ADC   PCL                            
521F- 0A                   ASL                                  
5220- 79 01 02             ADC   $0201,Y                        
5223- 38                   SEC                                  
5224- E9 B0                SBC   #$B0                           
5226- 95 3A                STA   PCL,X                          
5228- 88                   DEY                                  
5229- 88                   DEY                                  
522A- 88                   DEY                                  
522B- CA                   DEX                                  
522C- 10 E6                BPL   L5214                          
522E- A8                   TAY                                  
522F- 4A                   LSR                                  
5230- 6A                   ROR                                  
5231- 6A                   ROR                                  
5232- 6A                   ROR                                  
5233- 05 3C                ORA   A1L                            
5235- 8D 90 BF             STA   $BF90                          
5238- 08                   PHP                                  
5239- 29 1F                AND   #$1F                           
523B- 79 AB D7             ADC   $D7AB,Y                        
523E- 90 02                BCC   L5242                          
5240- 69 03                ADC   #$03                           
5242- 38        L5242      SEC                                  
5243- E9 07     L5243      SBC   #$07                           
5245- B0 FC                BCS   L5243                          
5247- 69 07                ADC   #$07                           
5249- E5 3B                SBC   PCH                            
524B- B0 02                BCS   L524F                          
524D- 69 07                ADC   #$07                           
524F- A8        L524F      TAY                                  
5250- B9 B8 D7             LDA   $D7B8,Y                        
5253- 28                   PLP                                  
5254- 2A                   ROL                                  
5255- 8D 91 BF             STA   $BF91                          
5258- A5 3D                LDA   A1H                            
525A- 8D 93 BF             STA   $BF93                          
525D- A5 3E                LDA   A2L                            
525F- 8D 92 BF             STA   $BF92                          
5262- 68                   PLA                                  
5263- AE 50 D7             LDX   $D750                          
5266- 9D 38 05             STA   $0538,X                        
5269- 60                   RTS                                  
526A- 00                   BRK                                  
526B- 1F 3B                ???   L52A8                          
526D- 5A                   PHY                                  
526E- 78                   SEI                                  
526F- 97 B5                ???   $B5                            
5271- D3                   ???                                  
5272- F2 14                SBC   ($14)                          
5274- 33                   ???                                  
5275- 51 5A                EOR   ($5A),Y                        
5277- 59 58 58             EOR   L5858,Y                        
527A- 57 56                ???   $56                            
527C- 5B                   ???                                  
527D- 00                   BRK                                  
527E- 00                   BRK                                  
527F- 00                   BRK                                  
5280- 00                   BRK                                  
5281- 00                   BRK                                  
5282- 00                   BRK                                  
5283- 00                   BRK                                  
5284- 00                   BRK                                  
5285- 00                   BRK                                  
5286- 00                   BRK                                  
5287- 00                   BRK                                  
5288- 00                   BRK                                  
5289- 00                   BRK                                  
528A- 00                   BRK                                  
528B- 00                   BRK                                  
528C- 00                   BRK                                  
528D- 00                   BRK                                  
528E- 00                   BRK                                  
528F- 00                   BRK                                  
5290- 00                   BRK                                  
5291- 00                   BRK                                  
5292- 00                   BRK                                  
5293- 00                   BRK                                  
5294- 00                   BRK                                  
5295- 00                   BRK                                  
5296- 00                   BRK                                  
5297- 00                   BRK                                  
5298- 00                   BRK                                  
5299- 00                   BRK                                  
529A- 00                   BRK                                  
529B- 48                   PHA                                  
529C- A5 45                LDA   A5H                            
529E- 8D 56 BF             STA   $BF56                          
52A1- 68                   PLA                                  
52A2- 85 45                STA   A5H                            
52A4- 68                   PLA                                  
52A5- 48                   PHA                                  
52A6- 29 10                AND   #$10                           
52A8- D0 18     L52A8      BNE   L52C2                          
52AA- AD 00 D0             LDA   $D000                          
52AD- 49 D8                EOR   #$D8                           
52AF- F0 02                BEQ   L52B3                          
52B1- A9 FF                LDA   #$FF                           
52B3- 8D 8D BF  L52B3      STA   $BF8D                          
52B6- 8D 57 BF             STA   $BF57                          
52B9- A9 BF                LDA   #$BF                           
52BB- 48                   PHA                                  
52BC- A9 50                LDA   #$50                           
52BE- 48                   PHA                                  
52BF- A9 04                LDA   #$04                           
52C1- 48                   PHA                                  
52C2- A9 FA     L52C2      LDA   #$FA                           
52C4- 48                   PHA                                  
52C5- A9 41                LDA   #$41                           
52C7- 48                   PHA                                  
52C8- 8D 82 C0             STA   PHASE1OFF                      
52CB- AD D7 FF             LDA   $FFD7                          
52CE- 48                   PHA                                  
52CF- AD D6 FF             LDA   $FFD6                          
52D2- 48                   PHA                                  
52D3- 4C C8 FF             JMP   $FFC8                          
52D6- 61 FA                ADC   ($FA,X)                        
52D8- 8D 88 BF             STA   $BF88                          
52DB- AD 56 BF             LDA   $BF56                          
52DE- 85 45                STA   A5H                            
52E0- AD 8B C0             LDA   DRV1EN                         
52E3- AD 8B C0             LDA   DRV1EN                         
52E6- AD 57 BF             LDA   $BF57                          
52E9- 4C D3 BF             JMP   $BFD3                          
52EC- 8C 97 BF             STY   $BF97                          
52EF- 8C 9A BF             STY   $BF9A                          
52F2- 60                   RTS                                  
52F3- 8D 97 BF  L52F3      STA   $BF97                          
52F6- 8D 9A BF             STA   $BF9A                          
52F9- 60                   RTS                                  
52FA- FB                   ???                                  
52FB- 03                   ???                                  
52FC- CB FF                ???   #$FF                           
52FE- 9B                   ???                                  
52FF- FF D8                ???   L52D9                          
5301- 20 BE D6             JSR   $D6BE                          
5304- BD 8E C0             LDA   Q7L,X                          
5307- EA                   NOP                                  
5308- EA                   NOP                                  
5309- 20 D0 D6             JSR   $D6D0                          
530C- B0 26                BCS   L5334                          
530E- A0 05                LDY   #$05                           
5310- 0A        L5310      ASL                                  
5311- 2E 56 D3             ROL   $D356                          
5314- 88                   DEY                                  
5315- D0 F9                BNE   L5310                          
5317- 0A                   ASL                                  
5318- 90 02                BCC   L531C                          
531A- 09 10                ORA   #$10                           
531C- 4A        L531C      LSR                                  
531D- 4A                   LSR                                  
531E- 4A                   LSR                                  
531F- 4A                   LSR                                  
5320- 48                   PHA                                  
5321- 20 38 D0             JSR   $D038                          
5324- 68                   PLA                                  
5325- B0 09                BCS   L5330                          
5327- E6 45                INC   A5H                            
5329- 69 02                ADC   #$02                           
532B- 20 38 D0             JSR   $D038                          
532E- C6 45                DEC   A5H                            
5330- AD 58 D3  L5330      LDA   $D358                          
5333- 60                   RTS                                  
5334- A9 27     L5334      LDA   #$27                           
5336- 38                   SEC                                  
5337- 60                   RTS                                  
5338- A0 01                LDY   #$01                           
533A- 8C 6A D3             STY   $D36A                          
533D- 8D 57 D3             STA   $D357                          
5340- A5 43                LDA   A4H                            
5342- 29 70                AND   #$70                           
5344- 85 3E                STA   A2L                            
5346- 20 9B D6             JSR   $D69B                          
5349- 20 DA D4             JSR   $D4DA                          
534C- 08                   PHP                                  
534D- A9 E8                LDA   #$E8                           
534F- 8D 70 D3             STA   $D370                          
5352- A5 43                LDA   A4H                            
5354- CD 59 D3             CMP   $D359                          
5357- 8D 59 D3             STA   $D359                          
535A- 08                   PHP                                  
535B- 0A                   ASL                                  
535C- BD 89 C0             LDA   MOTORON,X                      
535F- 90 01                BCC   L5362                          
5361- E8                   INX                                  
5362- BD 8A C0  L5362      LDA   DRV0EN,X                       
5365- 28                   PLP                                  
5366- F0 0A                BEQ   L5372                          
5368- 28                   PLP                                  
5369- A0 07                LDY   #$07                           
536B- 20 85 D3  L536B      JSR   $D385                          
536E- 88                   DEY                                  
536F- D0 FA                BNE   L536B                          
5371- 08                   PHP                                  
5372- A5 42     L5372      LDA   A4L                            
5374- F0 06                BEQ   L537C                          
5376- AD 56 D3             LDA   $D356                          
5379- 20 0C D1             JSR   $D10C                          
537C- 28        L537C      PLP                                  
537D- D0 0F                BNE   L538E                          
537F- A9 01     L537F      LDA   #$01                           
5381- 20 85 D3             JSR   $D385                          
5384- AD 70 D3             LDA   $D370                          
5387- 30 F6                BMI   L537F                          
5389- 20 DA D4             JSR   $D4DA                          
538C- F0 5C                BEQ   L53EA                          
538E- A5 42     L538E      LDA   A4L                            
5390- F0 6B                BEQ   L53FD                          
5392- 4A                   LSR                                  
5393- B0 03                BCS   L5398                          
5395- 20 F0 D5             JSR   $D5F0                          
5398- A0 40     L5398      LDY   #$40                           
539A- 8C 69 D3             STY   $D369                          
539D- A6 3E     L539D      LDX   A2L                            
539F- 20 98 D3             JSR   $D398                          
53A2- 90 1A                BCC   L53BE                          
53A4- CE 69 D3  L53A4      DEC   $D369                          
53A7- 10 F4                BPL   L539D                          
53A9- A9 27                LDA   #$27                           
53AB- CE 6A D3             DEC   $D36A                          
53AE- D0 3A                BNE   L53EA                          
53B0- AD 5A D3             LDA   $D35A                          
53B3- 48                   PHA                                  
53B4- 0A                   ASL                                  
53B5- 69 10                ADC   #$10                           
53B7- A0 40                LDY   #$40                           
53B9- 8C 69 D3             STY   $D369                          
53BC- D0 0E                BNE   L53CC                          
53BE- AC 6F D3  L53BE      LDY   $D36F                          
53C1- CC 5A D3             CPY   $D35A                          
53C4- F0 0F                BEQ   L53D5                          
53C6- AD 5A D3             LDA   $D35A                          
53C9- 48                   PHA                                  
53CA- 98                   TYA                                  
53CB- 0A                   ASL                                  
53CC- 20 D3 D4  L53CC      JSR   $D4D3                          
53CF- 68                   PLA                                  
53D0- 20 0C D1             JSR   $D10C                          
53D3- 90 C8                BCC   L539D                          
53D5- AD 6E D3  L53D5      LDA   $D36E                          
53D8- CD 57 D3             CMP   $D357                          
53DB- D0 C7                BNE   L53A4                          
53DD- A5 42                LDA   A4L                            
53DF- 4A                   LSR                                  
53E0- 90 12                BCC   L53F4                          
53E2- 20 FD D3             JSR   $D3FD                          
53E5- B0 BD                BCS   L53A4                          
53E7- A9 00     L53E7      LDA   #$00                           
53E9- D0 38                BNE   L5423                          
53EB- 8D 58 D3             STA   $D358                          
53EE- A6 3E                LDX   A2L                            
53F0- BD 88 C0             LDA   MOTOROFF,X                     
53F3- 60                   RTS                                  
53F4- 20 00 D5  L53F4      JSR   $D500                          
53F7- 90 EE                BCC   L53E7                          
53F9- A9 2B                LDA   #$2B                           
53FB- D0 ED                BNE   L53EA                          
53FD- A6 3E     L53FD      LDX   A2L                            
53FF- BD 8D C0             LDA   Q6H,X                          
5402- BD 8E C0             LDA   Q7L,X                          
5405- 2A                   ROL                                  
5406- BD 8C C0             LDA   Q6L,X                          
5409- 4C F7 D0             JMP   $D0F7                          
540C- 0A                   ASL                                  
540D- 8D 6F D3             STA   $D36F                          
5410- 20 25 D1             JSR   $D125                          
5413- 20 F1 D4             JSR   $D4F1                          
5416- BD 59 D3             LDA   $D359,X                        
5419- 8D 5A D3             STA   $D35A                          
541C- AD 6F D3             LDA   $D36F                          
541F- 9D 59 D3             STA   $D359,X                        
5422- 20 33 D1             JSR   $D133                          
5425- A0 03                LDY   #$03                           
5427- 98        L5427      TYA                                  
5428- 20 8A D1             JSR   $D18A                          
542B- 88                   DEY                                  
542C- 10 F9                BPL   L5427                          
542E- 4E 5A D3             LSR   $D35A                          
5431- 18                   CLC                                  
5432- 60                   RTS                                  
5433- 8D 72 D3             STA   $D372                          
5436- CD 5A D3             CMP   $D35A                          
5439- F0 4C                BEQ   L5487                          
543B- A9 00                LDA   #$00                           
543D- 8D 6B D3             STA   $D36B                          
5440- AD 5A D3  L5440      LDA   $D35A                          
5443- 8D 71 D3             STA   $D371                          
5446- 38                   SEC                                  
5447- ED 72 D3             SBC   $D372                          
544A- F0 37                BEQ   L5483                          
544C- B0 07                BCS   L5455                          
544E- 49 FF                EOR   #$FF                           
5450- EE 5A D3             INC   $D35A                          
5453- 90 05                BCC   L545A                          
5455- 69 FE     L5455      ADC   #$FE                           
5457- CE 5A D3             DEC   $D35A                          
545A- CD 6B D3  L545A      CMP   $D36B                          
545D- 90 03                BCC   L5462                          
545F- AD 6B D3             LDA   $D36B                          
5462- C9 09     L5462      CMP   #$09                           
5464- B0 02                BCS   L5468                          
5466- A8                   TAY                                  
5467- 38                   SEC                                  
5468- 20 87 D1  L5468      JSR   $D187                          
546B- B9 73 D3             LDA   $D373,Y                        
546E- 20 85 D3             JSR   $D385                          
5471- AD 71 D3             LDA   $D371                          
5474- 18                   CLC                                  
5475- 20 8A D1             JSR   $D18A                          
5478- B9 7C D3             LDA   $D37C,Y                        
547B- 20 85 D3             JSR   $D385                          
547E- EE 6B D3             INC   $D36B                          
5481- D0 BD                BNE   L5440                          
5483- 20 85 D3  L5483      JSR   $D385                          
5486- 18                   CLC                                  
5487- AD 5A D3  L5487      LDA   $D35A                          
548A- 29 03     L548A      AND   #$03                           
548C- 2A                   ROL                                  
548D- 05 3E                ORA   A2L                            
548F- AA                   TAX                                  
5490- BD 80 C0             LDA   PHASEOFF,X                     
5493- A6 3E                LDX   A2L                            
5495- 60                   RTS                                  
5496- 00                   BRK                                  
5497- 04 FF                TSB   $FF                            
5499- FF 08                ???   L54A3                          
549B- 0C FF 10             TSB   $10FF                          
549E- 14 18                TRB   $18                            
54A0- 00                   BRK                                  
54A1- 80 40                BRA   L54E3                          
54A3- C0 FF     L54A3      CPY   #$FF                           
54A5- FF 1C                ???   L54C3                          
54A7- 20 FF FF             JSR   $FFFF                          
54AA- FF 24                ???   L54D0                          
54AC- 28                   PLP                                  
54AD- 2C 30 34             BIT   L3430                          
54B0- FF FF                ???   L54B1                          
54B2- 38                   SEC                                  
54B3- 3C 40 44             BIT   L4440,X                        
54B6- 48                   PHA                                  
54B7- 4C FF 50             JMP   L50FF                          
54BA- 54 58                ???   $58                            
54BC- 5C 60 64             ???   $6460                          
54BF- 68                   PLA                                  
54C0- 00                   BRK                                  
54C1- 20 10 30             JSR   L3010                          
54C4- DE AA EB             DEC   $EBAA,X                        
54C7- FF FF                ???   L54C8                          
54C9- FF FF                ???   L54CA                          
54CB- 6C FF 70             JMP   ($70FF)                        
54CE- 74 78                STZ   $78,X                          
54D0- FF FF     L54D0      ???   L54D1                          
54D2- FF 7C                ???   L5550                          
54D4- FF FF                ???   L54D5                          
54D6- 80 84                BRA   L545C                          
54D8- FF 88                ???   L5462                          
54DA- 8C 90 94             STY   $9490                          
54DD- 98                   TYA                                  
54DE- 9C A0 00             STZ   $00A0                          
54E1- 08                   PHP                                  
54E2- 04 0C                TSB   $0C                            
54E4- FF A4                ???   L548A                          
54E6- A8                   TAY                                  
54E7- AC FF B0             LDY   $B0FF                          
54EA- B4 B8                LDY   $B8,X                          
54EC- BC C0 C4             LDY   $C4C0,X                        
54EF- C8                   INY                                  
54F0- FF FF                ???   L54F1                          
54F2- CC D0 D4             CPY   $D4D0                          
54F5- D8                   CLD                                  
54F6- DC E0 FF             ???   $FFE0                          
54F9- E4 E8                CPX   $E8                            
54FB- EC F0 F4             CPX   $F4F0                          
54FE- F8                   SED                                  
54FF- FC 00 00             ???   $0000                          
5502- 00                   BRK                                  
5503- 96 02                STX   $02,Y                          
5505- 00                   BRK                                  
5506- 00                   BRK                                  
5507- 97 01                ???   $01                            
5509- 00                   BRK                                  
550A- 00                   BRK                                  
550B- 9A                   TXS                                  
550C- 03                   ???                                  
550D- 00                   BRK                                  
550E- 00                   BRK                                  
550F- 9B                   ???                                  
5510- 00                   BRK                                  
5511- 02 00                ???   $00                            
5513- 9D 02 02             STA   $0202,X                        
5516- 00                   BRK                                  
5517- 9E 01 02             STZ   $0201,X                        
551A- 00                   BRK                                  
551B- 9F 03                ???   L5520                          
551D- 02 00                ???   $00                            
551F- A6 00                LDX   $00                            
5521- 01 00                ORA   ($00,X)                        
5523- A7 02                ???   $02                            
5525- 01 00                ORA   ($00,X)                        
5527- AB                   ???                                  
5528- 01 01                ORA   ($01,X)                        
552A- 00                   BRK                                  
552B- AC 03 01             LDY   $0103                          
552E- 00                   BRK                                  
552F- AD 00 03             LDA   $0300                          
5532- 00                   BRK                                  
5533- AE 02 03             LDX   $0302                          
5536- 00                   BRK                                  
5537- AF 01                ???   L553A                          
5539- 03                   ???                                  
553A- 00        L553A      BRK                                  
553B- B2 03                LDA   ($03)                          
553D- 03                   ???                                  
553E- 00                   BRK                                  
553F- B3                   ???                                  
5540- 00                   BRK                                  
5541- 00                   BRK                                  
5542- 02 B4                ???   $B4                            
5544- 02 00                ???   $00                            
5546- 02 B5                ???   $B5                            
5548- 01 00                ORA   ($00,X)                        
554A- 02 B6                ???   $B6                            
554C- 03                   ???                                  
554D- 00                   BRK                                  
554E- 02 B7                ???   $B7                            
5550- 00        L5550      BRK                                  
5551- 02 02                ???   $02                            
5553- B9 02 02             LDA   $0202,Y                        
5556- 02 BA                ???   $BA                            
5558- 01 02                ORA   ($02,X)                        
555A- 02 BB                ???   $BB                            
555C- 03                   ???                                  
555D- 02 02                ???   $02                            
555F- BC 00 01             LDY   $0100,X                        
5562- 02 BD                ???   $BD                            
5564- 02 01                ???   $01                            
5566- 02 BE                ???   $BE                            
5568- 01 01                ORA   ($01,X)                        
556A- 02 BF                ???   $BF                            
556C- 03                   ???                                  
556D- 01 02                ORA   ($02,X)                        
556F- CB 00                ???   #$00                           
5571- 03                   ???                                  
5572- 02 CD                ???   $CD                            
5574- 02 03                ???   $03                            
5576- 02 CE                ???   $CE                            
5578- 01 03                ORA   ($03,X)                        
557A- 02 CF                ???   $CF                            
557C- 03                   ???                                  
557D- 03                   ???                                  
557E- 02 D3                ???   $D3                            
5580- 00                   BRK                                  
5581- 00                   BRK                                  
5582- 01 D6                ORA   ($D6,X)                        
5584- 02 00                ???   $00                            
5586- 01 D7                ORA   ($D7,X)                        
5588- 01 00                ORA   ($00,X)                        
558A- 01 D9                ORA   ($D9,X)                        
558C- 03                   ???                                  
558D- 00                   BRK                                  
558E- 01 DA                ORA   ($DA,X)                        
5590- 00                   BRK                                  
5591- 02 01                ???   $01                            
5593- DB 02 02             ???   $0202,Y                        
5596- 01 DC                ORA   ($DC,X)                        
5598- 01 02                ORA   ($02,X)                        
559A- 01 DD                ORA   ($DD,X)                        
559C- 03                   ???                                  
559D- 02 01                ???   $01                            
559F- DE 00 01             DEC   $0100,X                        
55A2- 01 DF                ORA   ($DF,X)                        
55A4- 02 01                ???   $01                            
55A6- 01 E5                ORA   ($E5,X)                        
55A8- 01 01                ORA   ($01,X)                        
55AA- 01 E6                ORA   (HPAG,X)                       
55AC- 03                   ???                                  
55AD- 01 01                ORA   ($01,X)                        
55AF- E7 00                ???   $00                            
55B1- 03                   ???                                  
55B2- 01 E9                ORA   ($E9,X)                        
55B4- 02 03                ???   $03                            
55B6- 01 EA                ORA   ($EA,X)                        
55B8- 01 03                ORA   ($03,X)                        
55BA- 01 EB                ORA   ($EB,X)                        
55BC- 03                   ???                                  
55BD- 03                   ???                                  
55BE- 01 EC                ORA   ($EC,X)                        
55C0- 00                   BRK                                  
55C1- 00                   BRK                                  
55C2- 03                   ???                                  
55C3- ED 02 00             SBC   $0002                          
55C6- 03                   ???                                  
55C7- EE 01 00             INC   $0001                          
55CA- 03                   ???                                  
55CB- EF 03                ???   L55D0                          
55CD- 00                   BRK                                  
55CE- 03                   ???                                  
55CF- F2 00                SBC   ($00)                          
55D1- 02 03                ???   $03                            
55D3- F3                   ???                                  
55D4- 02 02                ???   $02                            
55D6- 03                   ???                                  
55D7- F4 01                ???   $01                            
55D9- 02 03                ???   $03                            
55DB- F5 03                SBC   $03,X                          
55DD- 02 03                ???   $03                            
55DF- F6 00                INC   $00,X                          
55E1- 01 03                ORA   ($03,X)                        
55E3- F7 02                ???   $02                            
55E5- 01 03                ORA   ($03,X)                        
55E7- F9 01 01             SBC   $0101,Y                        
55EA- 03                   ???                                  
55EB- FA                   PLX                                  
55EC- 03                   ???                                  
55ED- 01 03                ORA   ($03,X)                        
55EF- FB                   ???                                  
55F0- 00                   BRK                                  
55F1- 03                   ???                                  
55F2- 03                   ???                                  
55F3- FC 02 03             ???   $0302                          
55F6- 03                   ???                                  
55F7- FD 01 03             SBC   $0301,X                        
55FA- 03                   ???                                  
55FB- FE 03 03             INC   $0303,X                        
55FE- 03                   ???                                  
55FF- FF 00                ???   L5601                          
5601- 00        L5601      BRK                                  
5602- 00                   BRK                                  
5603- 00                   BRK                                  
5604- 00                   BRK                                  
5605- 00                   BRK                                  
5606- 00                   BRK                                  
5607- 00                   BRK                                  
5608- 00                   BRK                                  
5609- 00                   BRK                                  
560A- 00                   BRK                                  
560B- 00                   BRK                                  
560C- 00                   BRK                                  
560D- 00                   BRK                                  
560E- 00                   BRK                                  
560F- 00                   BRK                                  
5610- 00                   BRK                                  
5611- 00                   BRK                                  
5612- 00                   BRK                                  
5613- 00                   BRK                                  
5614- 00                   BRK                                  
5615- 00                   BRK                                  
5616- 00                   BRK                                  
5617- 00                   BRK                                  
5618- 00                   BRK                                  
5619- 00                   BRK                                  
561A- 00                   BRK                                  
561B- 00                   BRK                                  
561C- 00                   BRK                                  
561D- 00                   BRK                                  
561E- 00                   BRK                                  
561F- 00                   BRK                                  
5620- 00                   BRK                                  
5621- 00                   BRK                                  
5622- 00                   BRK                                  
5623- 00                   BRK                                  
5624- 00                   BRK                                  
5625- 00                   BRK                                  
5626- 00                   BRK                                  
5627- 00                   BRK                                  
5628- 00                   BRK                                  
5629- 00                   BRK                                  
562A- 00                   BRK                                  
562B- 00                   BRK                                  
562C- 00                   BRK                                  
562D- 00                   BRK                                  
562E- 00                   BRK                                  
562F- 00                   BRK                                  
5630- 00                   BRK                                  
5631- 00                   BRK                                  
5632- 00                   BRK                                  
5633- 00                   BRK                                  
5634- 00                   BRK                                  
5635- 00                   BRK                                  
5636- 00                   BRK                                  
5637- 00                   BRK                                  
5638- 00                   BRK                                  
5639- 00                   BRK                                  
563A- 00                   BRK                                  
563B- 00                   BRK                                  
563C- 00                   BRK                                  
563D- 00                   BRK                                  
563E- 00                   BRK                                  
563F- 00                   BRK                                  
5640- 00                   BRK                                  
5641- 00                   BRK                                  
5642- 00                   BRK                                  
5643- 00                   BRK                                  
5644- 00                   BRK                                  
5645- 00                   BRK                                  
5646- 00                   BRK                                  
5647- 00                   BRK                                  
5648- 00                   BRK                                  
5649- 00                   BRK                                  
564A- 00                   BRK                                  
564B- 00                   BRK                                  
564C- 00                   BRK                                  
564D- 00                   BRK                                  
564E- 00                   BRK                                  
564F- 00                   BRK                                  
5650- 00                   BRK                                  
5651- 00                   BRK                                  
5652- 00                   BRK                                  
5653- 00                   BRK                                  
5654- 00                   BRK                                  
5655- 00                   BRK                                  
5656- 00                   BRK                                  
5657- 00                   BRK                                  
5658- 00                   BRK                                  
5659- 00                   BRK                                  
565A- 00                   BRK                                  
565B- 00                   BRK                                  
565C- 00                   BRK                                  
565D- 00                   BRK                                  
565E- 00                   BRK                                  
565F- 00                   BRK                                  
5660- 00                   BRK                                  
5661- 00                   BRK                                  
5662- 00                   BRK                                  
5663- 00                   BRK                                  
5664- 00                   BRK                                  
5665- 00                   BRK                                  
5666- 00                   BRK                                  
5667- 00                   BRK                                  
5668- 00                   BRK                                  
5669- 00                   BRK                                  
566A- 00                   BRK                                  
566B- 00                   BRK                                  
566C- 00                   BRK                                  
566D- 00                   BRK                                  
566E- 00                   BRK                                  
566F- 00                   BRK                                  
5670- 00                   BRK                                  
5671- 00                   BRK                                  
5672- 00                   BRK                                  
5673- 01 30                ORA   (COLOR,X)                      
5675- 28                   PLP                                  
5676- 24 20                BIT   WNDLFT                         
5678- 1E 1D 1C             ASL   $1C1D,X                        
567B- 1C 70 2C             TRB   L2C70                          
567E- 26 22                ROL   WNDTOP                         
5680- 1F 1E                ???   L56A0                          
5682- 1D 1C 1C             ORA   $1C1C,X                        
5685- A2 11     L5685      LDX   #$11                           
5687- CA        L5687      DEX                                  
5688- D0 FD                BNE   L5687                          
568A- EE 6F D3             INC   $D36F                          
568D- D0 03                BNE   L5692                          
568F- EE 70 D3             INC   $D370                          
5692- 38        L5692      SEC                                  
5693- E9 01                SBC   #$01                           
5695- D0 EE                BNE   L5685                          
5697- 60                   RTS                                  
5698- A0 FC                LDY   #$FC                           
569A- 8C 6B D3             STY   $D36B                          
569D- C8        L569D      INY                                  
569E- D0 05                BNE   L56A5                          
56A0- EE 6B D3  L56A0      INC   $D36B                          
56A3- F0 56                BEQ   L56FB                          
56A5- BD 8C C0  L56A5      LDA   Q6L,X                          
56A8- 10 FB                BPL   L56A5                          
56AA- C9 D5     L56AA      CMP   #$D5                           
56AC- D0 EF                BNE   L569D                          
56AE- EA                   NOP                                  
56AF- BD 8C C0  L56AF      LDA   Q6L,X                          
56B2- 10 FB                BPL   L56AF                          
56B4- C9 AA                CMP   #$AA                           
56B6- D0 F2                BNE   L56AA                          
56B8- A0 03                LDY   #$03                           
56BA- BD 8C C0  L56BA      LDA   Q6L,X                          
56BD- 10 FB                BPL   L56BA                          
56BF- C9 96                CMP   #$96                           
56C1- D0 E7                BNE   L56AA                          
56C3- 78                   SEI                                  
56C4- A9 00                LDA   #$00                           
56C6- 8D 6C D3  L56C6      STA   $D36C                          
56C9- BD 8C C0  L56C9      LDA   Q6L,X                          
56CC- 10 FB                BPL   L56C9                          
56CE- 2A                   ROL                                  
56CF- 8D 6B D3             STA   $D36B                          
56D2- BD 8C C0  L56D2      LDA   Q6L,X                          
56D5- 10 FB                BPL   L56D2                          
56D7- 2D 6B D3             AND   $D36B                          
56DA- 99 6D D3             STA   $D36D,Y                        
56DD- 4D 6C D3             EOR   $D36C                          
56E0- 88                   DEY                                  
56E1- 10 E3                BPL   L56C6                          
56E3- A8                   TAY                                  
56E4- D0 15                BNE   L56FB                          
56E6- BD 8C C0  L56E6      LDA   Q6L,X                          
56E9- 10 FB                BPL   L56E6                          
56EB- C9 DE                CMP   #$DE                           
56ED- D0 0C                BNE   L56FB                          
56EF- EA                   NOP                                  
56F0- BD 8C C0  L56F0      LDA   Q6L,X                          
56F3- 10 FB                BPL   L56F0                          
56F5- C9 AA                CMP   #$AA                           
56F7- D0 02                BNE   L56FB                          
56F9- 18                   CLC                                  
56FA- 60                   RTS                                  
56FB- 38        L56FB      SEC                                  
56FC- 60                   RTS                                  
56FD- 8A                   TXA                                  
56FE- 09 8C                ORA   #$8C                           
5700- 8D 5A D4             STA   $D45A                          
5703- 8D 73 D4             STA   $D473                          
5706- 8D 89 D4             STA   $D489                          
5709- 8D 9D D4             STA   $D49D                          
570C- 8D B2 D4             STA   $D4B2                          
570F- A5 44                LDA   A5L                            
5711- A4 45                LDY   A5H                            
5713- 8D AF D4             STA   $D4AF                          
5716- 8C B0 D4             STY   $D4B0                          
5719- 38                   SEC                                  
571A- E9 54                SBC   #$54                           
571C- B0 01                BCS   L571F                          
571E- 88                   DEY                                  
571F- 8D 97 D4  L571F      STA   $D497                          
5722- 8C 98 D4             STY   $D498                          
5725- 38                   SEC                                  
5726- E9 57                SBC   #$57                           
5728- B0 01                BCS   L572B                          
572A- 88                   DEY                                  
572B- 8D 70 D4  L572B      STA   $D470                          
572E- 8C 71 D4             STY   $D471                          
5731- A0 20                LDY   #$20                           
5733- 88        L5733      DEY                                  
5734- F0 37                BEQ   L576D                          
5736- BD 8C C0  L5736      LDA   Q6L,X                          
5739- 10 FB                BPL   L5736                          
573B- 49 D5     L573B      EOR   #$D5                           
573D- D0 F4                BNE   L5733                          
573F- EA                   NOP                                  
5740- BD 8C C0  L5740      LDA   Q6L,X                          
5743- 10 FB                BPL   L5740                          
5745- C9 AA                CMP   #$AA                           
5747- D0 F2                BNE   L573B                          
5749- EA                   NOP                                  
574A- BD 8C C0  L574A      LDA   Q6L,X                          
574D- 10 FB                BPL   L574A                          
574F- C9 AD                CMP   #$AD                           
5751- D0 E8                BNE   L573B                          
5753- A0 AA                LDY   #$AA                           
5755- A9 00                LDA   #$00                           
5757- 85 3A     L5757      STA   PCL                            
5759- AE EC C0  L5759      LDX   $C0EC                          
575C- 10 FB                BPL   L5759                          
575E- BD 00 D1             LDA   $D100,X                        
5761- 99 56 D2             STA   $D256,Y                        
5764- 45 3A                EOR   PCL                            
5766- C8                   INY                                  
5767- D0 EE                BNE   L5757                          
5769- A0 AA                LDY   #$AA                           
576B- D0 05                BNE   L5772                          
576D- 38        L576D      SEC                                  
576E- 60                   RTS                                  
576F- 99 00 10  L576F      STA   $1000,Y                        
5772- AE EC C0  L5772      LDX   $C0EC                          
5775- 10 FB                BPL   L5772                          
5777- 5D 00 D1             EOR   $D100,X                        
577A- BE 56 D2             LDX   $D256,Y                        
577D- 5D 00 D2             EOR   $D200,X                        
5780- C8                   INY                                  
5781- D0 EC                BNE   L576F                          
5783- 48                   PHA                                  
5784- 29 FC                AND   #$FC                           
5786- A0 AA                LDY   #$AA                           
5788- AE EC C0  L5788      LDX   $C0EC                          
578B- 10 FB                BPL   L5788                          
578D- 5D 00 D1             EOR   $D100,X                        
5790- BE 56 D2             LDX   $D256,Y                        
5793- 5D 01 D2             EOR   $D201,X                        
5796- 99 00 10             STA   $1000,Y                        
5799- C8                   INY                                  
579A- D0 EC                BNE   L5788                          
579C- AE EC C0  L579C      LDX   $C0EC                          
579F- 10 FB                BPL   L579C                          
57A1- 29 FC                AND   #$FC                           
57A3- A0 AC                LDY   #$AC                           
57A5- 5D 00 D1  L57A5      EOR   $D100,X                        
57A8- BE 54 D2             LDX   $D254,Y                        
57AB- 5D 02 D2             EOR   $D202,X                        
57AE- 99 00 10             STA   $1000,Y                        
57B1- AE EC C0  L57B1      LDX   $C0EC                          
57B4- 10 FB                BPL   L57B1                          
57B6- C8                   INY                                  
57B7- D0 EC                BNE   L57A5                          
57B9- 29 FC                AND   #$FC                           
57BB- 5D 00 D1             EOR   $D100,X                        
57BE- D0 0C                BNE   L57CC                          
57C0- A6 3E                LDX   A2L                            
57C2- BD 8C C0  L57C2      LDA   Q6L,X                          
57C5- 10 FB                BPL   L57C2                          
57C7- C9 DE                CMP   #$DE                           
57C9- 18                   CLC                                  
57CA- F0 01                BEQ   L57CD                          
57CC- 38        L57CC      SEC                                  
57CD- 68        L57CD      PLA                                  
57CE- A0 55                LDY   #$55                           
57D0- 91 44                STA   (A5L),Y                        
57D2- 60                   RTS                                  
57D3- 20 F1 D4             JSR   $D4F1                          
57D6- 9D 59 D3             STA   $D359,X                        
57D9- 60                   RTS                                  
57DA- A6 3E                LDX   A2L                            
57DC- A0 00                LDY   #$00                           
57DE- BD 8C C0  L57DE      LDA   Q6L,X                          
57E1- 20 F0 D4             JSR   $D4F0                          
57E4- 48                   PHA                                  
57E5- 68                   PLA                                  
57E6- DD 8C C0             CMP   Q6L,X                          
57E9- D0 05                BNE   L57F0                          
57EB- A9 28                LDA   #$28                           
57ED- 88                   DEY                                  
57EE- D0 EE                BNE   L57DE                          
57F0- 60        L57F0      RTS                                  
57F1- 48                   PHA                                  
57F2- A5 43                LDA   A4H                            
57F4- 4A                   LSR                                  
57F5- 4A                   LSR                                  
57F6- 4A                   LSR                                  
57F7- 4A                   LSR                                  
57F8- C9 08                CMP   #$08                           
57FA- 29 07                AND   #$07                           
57FC- 2A                   ROL                                  
57FD- AA                   TAX                                  
57FE- 68                   PLA                                  
57FF- 60                   RTS                                  
5800- 38                   SEC                                  
5801- BD 8D C0             LDA   Q6H,X                          
5804- BD 8E C0             LDA   Q7L,X                          
5807- 10 03                BPL   L580C                          
5809- 4C DF D5             JMP   $D5DF                          
580C- AD 00 D3  L580C      LDA   $D300                          
580F- 85 3A                STA   PCL                            
5811- A9 FF                LDA   #$FF                           
5813- 9D 8F C0             STA   Q8H,X                          
5816- 1D 8C C0             ORA   Q6L,X                          
5819- A0 04                LDY   #$04                           
581B- EA                   NOP                                  
581C- 48                   PHA                                  
581D- 68                   PLA                                  
581E- 48        L581E      PHA                                  
581F- 68                   PLA                                  
5820- 20 E7 D5             JSR   $D5E7                          
5823- 88                   DEY                                  
5824- D0 F8                BNE   L581E                          
5826- A9 D5                LDA   #$D5                           
5828- 20 E6 D5             JSR   $D5E6                          
582B- A9 AA                LDA   #$AA                           
582D- 20 E6 D5             JSR   $D5E6                          
5830- A9 AD                LDA   #$AD                           
5832- 20 E6 D5             JSR   $D5E6                          
5835- 98                   TYA                                  
5836- A0 56                LDY   #$56                           
5838- D0 03                BNE   L583D                          
583A- B9 00 D3  L583A      LDA   $D300,Y                        
583D- 59 FF D2  L583D      EOR   $D2FF,Y                        
5840- AA                   TAX                                  
5841- BD 03 D2             LDA   $D203,X                        
5844- A6 3E                LDX   A2L                            
5846- 9D 8D C0             STA   Q6H,X                          
5849- BD 8C C0             LDA   Q6L,X                          
584C- 88                   DEY                                  
584D- D0 EB                BNE   L583A                          
584F- A5 3A                LDA   PCL                            
5851- A0 00                LDY   #$00                           
5853- 59 00 10  L5853      EOR   $1000,Y                        
5856- 29 FC                AND   #$FC                           
5858- AA        L5858      TAX                                  
5859- BD 03 D2             LDA   $D203,X                        
585C- A2 60                LDX   #$60                           
585E- 9D 8D C0             STA   Q6H,X                          
5861- BD 8C C0             LDA   Q6L,X                          
5864- B9 00 10             LDA   $1000,Y                        
5867- C8                   INY                                  
5868- D0 E9                BNE   L5853                          
586A- A5 3B                LDA   PCH                            
586C- F0 52                BEQ   L58C0                          
586E- A5 3F                LDA   A2H                            
5870- F0 41                BEQ   L58B3                          
5872- 4A                   LSR                                  
5873- A5 3B                LDA   PCH                            
5875- 9D 8D C0             STA   Q6H,X                          
5878- BD 8C C0             LDA   Q6L,X                          
587B- A5 3C                LDA   A1L                            
587D- EA                   NOP                                  
587E- C8                   INY                                  
587F- B0 18                BCS   L5899                          
5881- 59 00 11  L5881      EOR   $1100,Y                        
5884- 29 FC                AND   #$FC                           
5886- AA                   TAX                                  
5887- BD 03 D2             LDA   $D203,X                        
588A- A2 60                LDX   #$60                           
588C- 9D 8D C0             STA   Q6H,X                          
588F- BD 8C C0             LDA   Q6L,X                          
5892- B9 00 11             LDA   $1100,Y                        
5895- C8                   INY                                  
5896- 59 00 11             EOR   $1100,Y                        
5899- C4 3F     L5899      CPY   A2H                            
589B- 29 FC                AND   #$FC                           
589D- AA                   TAX                                  
589E- BD 03 D2             LDA   $D203,X                        
58A1- A2 60                LDX   #$60                           
58A3- 9D 8D C0             STA   Q6H,X                          
58A6- BD 8C C0             LDA   Q6L,X                          
58A9- B9 00 11             LDA   $1100,Y                        
58AC- C8                   INY                                  
58AD- 90 D2                BCC   L5881                          
58AF- B0 00                BCS   L58B1                          
58B1- B0 0D     L58B1      BCS   L58C0                          
58B3- AD 3B 00  L58B3      LDA   PCH                            
58B6- 9D 8D C0             STA   Q6H,X                          
58B9- BD 8C C0             LDA   Q6L,X                          
58BC- 48                   PHA                                  
58BD- 68                   PLA                                  
58BE- 48                   PHA                                  
58BF- 68                   PLA                                  
58C0- A6 3D     L58C0      LDX   A1H                            
58C2- BD 03 D2             LDA   $D203,X                        
58C5- A2 60                LDX   #$60                           
58C7- 9D 8D C0             STA   Q6H,X                          
58CA- BD 8C C0             LDA   Q6L,X                          
58CD- A0 00                LDY   #$00                           
58CF- 48                   PHA                                  
58D0- 68                   PLA                                  
58D1- EA                   NOP                                  
58D2- EA                   NOP                                  
58D3- B9 C4 D1  L58D3      LDA   $D1C4,Y                        
58D6- 20 E9 D5             JSR   $D5E9                          
58D9- C8                   INY                                  
58DA- C0 04                CPY   #$04                           
58DC- D0 F5                BNE   L58D3                          
58DE- 18                   CLC                                  
58DF- BD 8E C0             LDA   Q7L,X                          
58E2- BD 8C C0             LDA   Q6L,X                          
58E5- 60                   RTS                                  
58E6- 18                   CLC                                  
58E7- 48                   PHA                                  
58E8- 68                   PLA                                  
58E9- 9D 8D C0             STA   Q6H,X                          
58EC- 1D 8C C0             ORA   Q6L,X                          
58EF- 60                   RTS                                  
58F0- A5 44                LDA   A5L                            
58F2- A4 45                LDY   A5H                            
58F4- 18                   CLC                                  
58F5- 69 02                ADC   #$02                           
58F7- 90 01                BCC   L58FA                          
58F9- C8                   INY                                  
58FA- 8D 30 D6  L58FA      STA   $D630                          
58FD- 8C 31 D6             STY   $D631                          
5900- 38                   SEC                                  
5901- E9 56                SBC   #$56                           
5903- B0 01                BCS   L5906                          
5905- 88                   DEY                                  
5906- 8D 25 D6  L5906      STA   $D625                          
5909- 8C 26 D6             STY   $D626                          
590C- 38                   SEC                                  
590D- E9 56                SBC   #$56                           
590F- B0 01                BCS   L5912                          
5911- 88                   DEY                                  
5912- 8D 1B D6  L5912      STA   $D61B                          
5915- 8C 1C D6             STY   $D61C                          
5918- A0 AA                LDY   #$AA                           
591A- B9 00 10  L591A      LDA   $1000,Y                        
591D- 29 03                AND   #$03                           
591F- AA                   TAX                                  
5920- BD E0 D1             LDA   $D1E0,X                        
5923- 48                   PHA                                  
5924- B9 56 10             LDA   $1056,Y                        
5927- 29 03                AND   #$03                           
5929- AA                   TAX                                  
592A- 68                   PLA                                  
592B- 1D C0 D1             ORA   $D1C0,X                        
592E- 48                   PHA                                  
592F- B9 AC 10             LDA   $10AC,Y                        
5932- 29 03                AND   #$03                           
5934- AA                   TAX                                  
5935- 68                   PLA                                  
5936- 1D A0 D1             ORA   $D1A0,X                        
5939- 48                   PHA                                  
593A- 98                   TYA                                  
593B- 49 FF                EOR   #$FF                           
593D- AA                   TAX                                  
593E- 68                   PLA                                  
593F- 9D 00 D3             STA   $D300,X                        
5942- C8                   INY                                  
5943- D0 D5                BNE   L591A                          
5945- A4 44                LDY   A5L                            
5947- 88                   DEY                                  
5948- 84 3F                STY   A2H                            
594A- A5 44                LDA   A5L                            
594C- 8D 52 D5             STA   $D552                          
594F- F0 0E                BEQ   L595F                          
5951- 49 FF                EOR   #$FF                           
5953- A8                   TAY                                  
5954- B1 44                LDA   (A5L),Y                        
5956- C8                   INY                                  
5957- 51 44                EOR   (A5L),Y                        
5959- 29 FC                AND   #$FC                           
595B- AA                   TAX                                  
595C- BD 03 D2             LDA   $D203,X                        
595F- 85 3B     L595F      STA   PCH                            
5961- F0 0C                BEQ   L596F                          
5963- A5 3F                LDA   A2H                            
5965- 4A                   LSR                                  
5966- B1 44                LDA   (A5L),Y                        
5968- 90 03                BCC   L596D                          
596A- C8                   INY                                  
596B- 51 44                EOR   (A5L),Y                        
596D- 85 3C     L596D      STA   A1L                            
596F- A0 FF     L596F      LDY   #$FF                           
5971- B1 44                LDA   (A5L),Y                        
5973- 29 FC                AND   #$FC                           
5975- 85 3D                STA   A1H                            
5977- A4 45                LDY   A5H                            
5979- 8C 55 D5             STY   $D555                          
597C- 8C 66 D5             STY   $D566                          
597F- C8                   INY                                  
5980- 8C 83 D5             STY   $D583                          
5983- 8C 94 D5             STY   $D594                          
5986- 8C 98 D5             STY   $D598                          
5989- 8C AB D5             STY   $D5AB                          
598C- A6 3E                LDX   A2L                            
598E- 8E 5D D5             STX   $D55D                          
5991- 8E 8B D5             STX   $D58B                          
5994- 8E A2 D5             STX   $D5A2                          
5997- 8E C6 D5             STX   $D5C6                          
599A- 60                   RTS                                  
599B- 4D 59 D3             EOR   $D359                          
599E- 0A                   ASL                                  
599F- F0 1C                BEQ   L59BD                          
59A1- A9 01                LDA   #$01                           
59A3- 8D 70 D3             STA   $D370                          
59A6- AD 59 D3  L59A6      LDA   $D359                          
59A9- 29 70                AND   #$70                           
59AB- AA                   TAX                                  
59AC- F0 0F                BEQ   L59BD                          
59AE- 20 DC D4             JSR   $D4DC                          
59B1- F0 0A                BEQ   L59BD                          
59B3- A9 01                LDA   #$01                           
59B5- 20 85 D3             JSR   $D385                          
59B8- AD 70 D3             LDA   $D370                          
59BB- D0 E9                BNE   L59A6                          
59BD- 60        L59BD      RTS                                  
59BE- A5 43                LDA   A4H                            
59C0- 29 7F                AND   #$7F                           
59C2- AA                   TAX                                  
59C3- BD 80 C0             LDA   PHASEOFF,X                     
59C6- BD 82 C0             LDA   PHASE1OFF,X                    
59C9- BD 84 C0             LDA   PHASE2OFF,X                    
59CC- BD 86 C0             LDA   PHASE3OFF,X                    
59CF- 60                   RTS                                  
59D0- A5 42                LDA   A4L                            
59D2- C9 04                CMP   #$04                           
59D4- B0 10                BCS   L59E6                          
59D6- A5 46                LDA   $46                            
59D8- A6 47                LDX   $47                            
59DA- 8E 56 D3             STX   $D356                          
59DD- F0 09                BEQ   L59E8                          
59DF- CA                   DEX                                  
59E0- D0 04                BNE   L59E6                          
59E2- C9 18                CMP   #$18                           
59E4- 90 02                BCC   L59E8                          
59E6- 38        L59E6      SEC                                  
59E7- 60                   RTS                                  
59E8- 18        L59E8      CLC                                  
59E9- 60                   RTS                                  
59EA- 00                   BRK                                  
59EB- 00                   BRK                                  
59EC- 00                   BRK                                  
59ED- 00                   BRK                                  
59EE- 00                   BRK                                  
59EF- 00                   BRK                                  
59F0- 00                   BRK                                  
59F1- 00                   BRK                                  
59F2- 00                   BRK                                  
59F3- 00                   BRK                                  
59F4- 00                   BRK                                  
59F5- 00                   BRK                                  
59F6- 00                   BRK                                  
59F7- 00                   BRK                                  
59F8- 00                   BRK                                  
59F9- 00                   BRK                                  
59FA- 00        L59FA      BRK                                  
59FB- 00                   BRK                                  
59FC- 00                   BRK                                  
59FD- 00                   BRK                                  
59FE- 00                   BRK                                  
59FF- 00                   BRK                                  
5A00- D8                   CLD                                  
5A01- A9 69                LDA   #$69                           
5A03- 8D F2 03             STA   DOSRESET                       
5A06- A9 FF                LDA   #$FF                           
5A08- 8D F3 03             STA   $03F3                          
5A0B- 49 A5                EOR   #$A5                           
5A0D- 8D F4 03             STA   $03F4                          
5A10- AD 82 C0             LDA   PHASE1OFF                      
5A13- 20 39 FB             JSR   $FB39                          
5A16- 20 93 FE             JSR   $FE93                          
5A19- 20 89 FE             JSR   $FE89                          
5A1C- 20 84 FE             JSR   SETNORM                        
5A1F- 8D 0C C0             STA   CLR80VID                       
5A22- 8D 0E C0             STA   CLRALTCHAR                     
5A25- 8D 00 C0             STA   KBD                            
5A28- A9 01                LDA   #$01                           
5A2A- 8D 6F BF             STA   $BF6F                          
5A2D- A9 00                LDA   #$00                           
5A2F- A2 16                LDX   #$16                           
5A31- 9D 58 BF  L5A31      STA   $BF58,X                        
5A34- CA                   DEX                                  
5A35- 10 FA                BPL   L5A31                          
5A37- A9 CF                LDA   #$CF                           
5A39- 8D 58 BF             STA   $BF58                          
5A3C- 20 00 BF             JSR   MLI                            
5A3F- C7 FC                ???   $FC                            
5A41- 12 20                ORA   (WNDLFT)                       
5A43- 00                   BRK                                  
5A44- BF C6                ???   L5A0C                          
5A46- FC 12 AE             ???   $AE12                          
5A49- 31 BF                AND   ($BF),Y                        
5A4B- 86 06     L5A4B      STX   $06                            
5A4D- BD 32 BF             LDA   $BF32,X                        
5A50- 29 F0                AND   #$F0                           
5A52- CD 30 BF             CMP   $BF30                          
5A55- F0 03                BEQ   L5A5A                          
5A57- CA                   DEX                                  
5A58- 10 F1                BPL   L5A4B                          
5A5A- AE 80 02  L5A5A      LDX   $0280                          
5A5D- F0 16                BEQ   L5A75                          
5A5F- 8D F1 12             STA   $12F1                          
5A62- 4C 8C 11             JMP   $118C                          
5A65- A6 06                LDX   $06                            
5A67- E0 00                CPX   #$00                           
5A69- D0 04                BNE   L5A6F                          
5A6B- AE 31 BF             LDX   $BF31                          
5A6E- E8                   INX                                  
5A6F- CA        L5A6F      DEX                                  
5A70- 86 06                STX   $06                            
5A72- BD 32 BF             LDA   $BF32,X                        
5A75- 8D F1 12  L5A75      STA   $12F1                          
5A78- 8D 30 BF             STA   $BF30                          
5A7B- 20 58 FC             JSR   HOME                           
5A7E- 20 00 BF             JSR   MLI                            
5A81- C5 F0                CMP   $F0                            
5A83- 12 B0                ORA   ($B0)                          
5A85- 46 AD                LSR   $AD                            
5A87- 81 02                STA   ($02,X)                        
5A89- 29 0F                AND   #$0F                           
5A8B- F0 3F                BEQ   L5ACC                          
5A8D- 69 02                ADC   #$02                           
5A8F- 8D 80 02             STA   $0280                          
5A92- AA                   TAX                                  
5A93- A9 2F                LDA   #$2F                           
5A95- 8D 81 02             STA   $0281                          
5A98- 9D 80 02             STA   $0280,X                        
5A9B- A9 00                LDA   #$00                           
5A9D- 9D 81 02             STA   $0281,X                        
5AA0- 85 09                STA   $09                            
5AA2- 8D F9 12             STA   $12F9                          
5AA5- 8D 02 13             STA   $1302                          
5AA8- 8D 03 13             STA   $1303                          
5AAB- A2 00                LDX   #$00                           
5AAD- A9 0C                LDA   #$0C                           
5AAF- 20 5B 12             JSR   $125B                          
5AB2- A2 12                LDX   #$12                           
5AB4- A9 0C                LDA   #$0C                           
5AB6- 20 5B 12             JSR   $125B                          
5AB9- A2 00                LDX   #$00                           
5ABB- BD 81 02  L5ABB      LDA   $0281,X                        
5ABE- F0 06                BEQ   L5AC6                          
5AC0- 20 69 12             JSR   $1269                          
5AC3- E8                   INX                                  
5AC4- D0 F5                BNE   L5ABB                          
5AC6- 20 00 BF  L5AC6      JSR   MLI                            
5AC9- C8                   INY                                  
5ACA- E8                   INX                                  
5ACB- 12 B0                ORA   ($B0)                          
5ACD- 5C 20 B9             ???   $B920                          
5AD0- 12 A9                ORA   ($A9)                          
5AD2- 2B                   ???                                  
5AD3- 8D F8 12             STA   $12F8                          
5AD6- 20 00 BF             JSR   MLI                            
5AD9- CA                   DEX                                  
5ADA- F4 12                ???   $12                            
5ADC- B0 4C                BCS   L5B2A                          
5ADE- A2 03                LDX   #$03                           
5AE0- BD 23 20  L5AE0      LDA   L2023,X                        
5AE3- 95 A5                STA   ARG,X                          
5AE5- CA                   DEX                                  
5AE6- 10 F8                BPL   L5AE0                          
5AE8- 8D F8 12             STA   $12F8                          
5AEB- A9 01                LDA   #$01                           
5AED- 85 A9                STA   $A9                            
5AEF- A5 A7                LDA   $A7                            
5AF1- 05 A8                ORA   $A8                            
5AF3- D0 03                BNE   L5AF8                          
5AF5- 4C B5 11  L5AF5      JMP   $11B5                          
5AF8- 24 A8     L5AF8      BIT   $A8                            
5AFA- 30 F9                BMI   L5AF5                          
5AFC- AD 02 13  L5AFC      LDA   $1302                          
5AFF- 29 FE                AND   #$FE                           
5B01- 8D 02 13             STA   $1302                          
5B04- A4 A9                LDY   $A9                            
5B06- A9 00                LDA   #$00                           
5B08- C4 A6                CPY   $A6                            
5B0A- 90 09                BCC   L5B15                          
5B0C- A8                   TAY                                  
5B0D- 84 A9                STY   $A9                            
5B0F- EE 02 13             INC   $1302                          
5B12- EE 02 13  L5B12      INC   $1302                          
5B15- 88        L5B15      DEY                                  
5B16- 18                   CLC                                  
5B17- 30 06                BMI   L5B1F                          
5B19- 65 A5                ADC   ARG                            
5B1B- 90 F8                BCC   L5B15                          
5B1D- B0 F3                BCS   L5B12                          
5B1F- 69 04     L5B1F      ADC   #$04                           
5B21- 8D 01 13             STA   $1301                          
5B24- 20 00 BF             JSR   MLI                            
5B27- CE FF 12             DEC   $12FF                          
5B2A- B0 47     L5B2A      BCS   L5B73                          
5B2C- 20 00 BF             JSR   MLI                            
5B2F- CA                   DEX                                  
5B30- F4 12                ???   $12                            
5B32- B0 3F                BCS   L5B73                          
5B34- E6 A9                INC   $A9                            
5B36- AD 00 20             LDA   L2000                          
5B39- F0 C1                BEQ   L5AFC                          
5B3B- 29 0F                AND   #$0F                           
5B3D- 8D 00 20             STA   L2000                          
5B40- C6 A7                DEC   $A7                            
5B42- D0 02                BNE   L5B46                          
5B44- C6 A8                DEC   $A8                            
5B46- 6E 1E 20  L5B46      ROR   L201E                          
5B49- 90 AD                BCC   L5AF8                          
5B4B- AD 10 20             LDA   L2010                          
5B4E- C9 0F                CMP   #$0F                           
5B50- F0 04                BEQ   L5B56                          
5B52- C9 FF                CMP   #$FF                           
5B54- D0 A2                BNE   L5AF8                          
5B56- A6 09     L5B56      LDX   $09                            
5B58- E0 20                CPX   #$20                           
5B5A- B0 59                BCS   L5BB5                          
5B5C- 95 80                STA   $80,X                          
5B5E- 20 6E 12             JSR   $126E                          
5B61- A0 0F                LDY   #$0F                           
5B63- B9 00 20  L5B63      LDA   L2000,Y                        
5B66- 91 0D                STA   ($0D),Y                        
5B68- 88                   DEY                                  
5B69- 10 F8                BPL   L5B63                          
5B6B- 20 83 12             JSR   $1283                          
5B6E- E6 09                INC   $09                            
5B70- 4C F8 10             JMP   $10F8                          
5B73- 4C 65 10  L5B73      JMP   $1065                          
5B76- AE 80 02  L5B76      LDX   $0280                          
5B79- CA        L5B79      DEX                                  
5B7A- F0 55                BEQ   L5BD1                          
5B7C- BD 80 02             LDA   $0280,X                        
5B7F- C9 2F                CMP   #$2F                           
5B81- D0 F6                BNE   L5B79                          
5B83- CA                   DEX                                  
5B84- F0 4B                BEQ   L5BD1                          
5B86- 8E 80 02             STX   $0280                          
5B89- EE 80 02             INC   $0280                          
5B8C- 20 58 FC             JSR   HOME                           
5B8F- AE 80 02             LDX   $0280                          
5B92- 4C 93 10             JMP   $1093                          
5B95- 20 83 12  L5B95      JSR   $1283                          
5B98- A6 09                LDX   $09                            
5B9A- E8                   INX                                  
5B9B- E4 0F                CPX   $0F                            
5B9D- 90 0E                BCC   L5BAD                          
5B9F- A2 00                LDX   #$00                           
5BA1- F0 0A                BEQ   L5BAD                          
5BA3- 20 83 12  L5BA3      JSR   $1283                          
5BA6- A6 09                LDX   $09                            
5BA8- D0 02                BNE   L5BAC                          
5BAA- A6 0F                LDX   $0F                            
5BAC- CA        L5BAC      DEX                                  
5BAD- 86 09     L5BAD      STX   $09                            
5BAF- 4C C8 11             JMP   $11C8                          
5BB2- 4C 7B 10  L5BB2      JMP   $107B                          
5BB5- 20 00 BF  L5BB5      JSR   MLI                            
5BB8- CC EE 12             CPY   $12EE                          
5BBB- B0 B6                BCS   L5B73                          
5BBD- A6 09                LDX   $09                            
5BBF- 86 0F                STX   $0F                            
5BC1- A9 00                LDA   #$00                           
5BC3- 85 09                STA   $09                            
5BC5- 8A                   TXA                                  
5BC6- F0 09                BEQ   L5BD1                          
5BC8- 20 80 FE             JSR   SETINV                         
5BCB- 20 83 12             JSR   $1283                          
5BCE- 20 84 FE             JSR   SETNORM                        
5BD1- AD 00 C0  L5BD1      LDA   KBD                            
5BD4- 10 FB                BPL   L5BD1                          
5BD6- 8D 10 C0             STA   KBDSTRB                        
5BD9- C9 89                CMP   #$89                           
5BDB- F0 96                BEQ   L5B73                          
5BDD- C9 9B                CMP   #$9B                           
5BDF- F0 95                BEQ   L5B76                          
5BE1- C9 A0                CMP   #$A0                           
5BE3- F0 CD                BEQ   L5BB2                          
5BE5- A6 0F                LDX   $0F                            
5BE7- F0 E8                BEQ   L5BD1                          
5BE9- C9 88                CMP   #$88                           
5BEB- F0 B6                BEQ   L5BA3                          
5BED- C9 8B                CMP   #$8B                           
5BEF- F0 B2                BEQ   L5BA3                          
5BF1- C9 95                CMP   #$95                           
5BF3- F0 A0                BEQ   L5B95                          
5BF5- C9 8A                CMP   #$8A                           
5BF7- F0 9C                BEQ   L5B95                          
5BF9- C9 8D                CMP   #$8D                           
5BFB- D0 D4                BNE   L5BD1                          
5BFD- 20 00 BF             JSR   MLI                            
5C00- C6 FC                DEC   $FC                            
5C02- 12 B0                ORA   ($B0)                          
5C04- B6 20                LDX   WNDLFT,Y                       
5C06- 6E 12 AE             ROR   $AE12                          
5C09- 80 02                BRA   L5C0D                          
5C0B- C8        L5C0B      INY                                  
5C0C- B1 0D                LDA   ($0D),Y                        
5C0E- E8                   INX                                  
5C0F- 9D 80 02             STA   $0280,X                        
5C12- C4 08                CPY   $08                            
5C14- 90 F5                BCC   L5C0B                          
5C16- 8E 80 02             STX   $0280                          
5C19- A4 09                LDY   $09                            
5C1B- B9 80 00             LDA   $0080,Y                        
5C1E- 30 03                BMI   L5C23                          
5C20- 4C 89 11             JMP   $1189                          
5C23- 20 00 BF  L5C23      JSR   MLI                            
5C26- C8                   INY                                  
5C27- E8                   INX                                  
5C28- 12 B0                ORA   ($B0)                          
5C2A- 27 20                ???   WNDLFT                         
5C2C- B9 12 20             LDA   L2012,Y                        
5C2F- 00                   BRK                                  
5C30- BF D1                ???   L5C03                          
5C32- FF 12                ???   L5C46                          
5C34- B0 F3                BCS   L5C29                          
5C36- AD 01 13             LDA   $1301                          
5C39- 8D F8 12             STA   $12F8                          
5C3C- AD 02 13             LDA   $1302                          
5C3F- 8D F9 12             STA   $12F9                          
5C42- 20 00 BF             JSR   MLI                            
5C45- CA                   DEX                                  
5C46- F4 12     L5C46      ???   $12                            
5C48- 08                   PHP                                  
5C49- 20 00 BF             JSR   MLI                            
5C4C- CC EE 12             CPY   $12EE                          
5C4F- 90 04                BCC   L5C55                          
5C51- 68                   PLA                                  
5C52- 4C 73 11  L5C52      JMP   $1173                          
5C55- 28        L5C55      PLP                                  
5C56- B0 FA                BCS   L5C52                          
5C58- 4C 00 20             JMP   L2000                          
5C5B- 85 24                STA   CH                             
5C5D- BD C3 12  L5C5D      LDA   $12C3,X                        
5C60- F0 06                BEQ   L5C68                          
5C62- 20 F0 FD             JSR   COUT1                          
5C65- E8                   INX                                  
5C66- D0 F5                BNE   L5C5D                          
5C68- 60        L5C68      RTS                                  
5C69- 09 80                ORA   #$80                           
5C6B- 4C F0 FD             JMP   COUT1                          
5C6E- A5 09                LDA   $09                            
5C70- 0A                   ASL                                  
5C71- 0A                   ASL                                  
5C72- 0A                   ASL                                  
5C73- 0A                   ASL                                  
5C74- 85 0D                STA   $0D                            
5C76- A9 16                LDA   #$16                           
5C78- 69 00                ADC   #$00                           
5C7A- 85 0E                STA   $0E                            
5C7C- A0 00                LDY   #$00                           
5C7E- B1 0D                LDA   ($0D),Y                        
5C80- 85 08                STA   $08                            
5C82- 60                   RTS                                  
5C83- A9 02                LDA   #$02                           
5C85- A6 09                LDX   $09                            
5C87- E0 10                CPX   #$10                           
5C89- 90 02                BCC   L5C8D                          
5C8B- 69 13                ADC   #$13                           
5C8D- 85 24     L5C8D      STA   CH                             
5C8F- A5 09                LDA   $09                            
5C91- 29 0F                AND   #$0F                           
5C93- 18                   CLC                                  
5C94- 69 05                ADC   #$05                           
5C96- 20 5B FB             JSR   $FB5B                          
5C99- 20 B4 12             JSR   $12B4                          
5C9C- A6 09                LDX   $09                            
5C9E- B5 80                LDA   $80,X                          
5CA0- 30 05                BMI   L5CA7                          
5CA2- A9 AF                LDA   #$AF                           
5CA4- 20 69 12  L5CA4      JSR   $1269                          
5CA7- 20 6E 12  L5CA7      JSR   $126E                          
5CAA- C8        L5CAA      INY                                  
5CAB- B1 0D                LDA   ($0D),Y                        
5CAD- 20 69 12             JSR   $1269                          
5CB0- C4 08                CPY   $08                            
5CB2- 90 F6                BCC   L5CAA                          
5CB4- A9 A0                LDA   #$A0                           
5CB6- 4C 69 12             JMP   $1269                          
5CB9- AD ED 12             LDA   $12ED                          
5CBC- 8D F5 12             STA   $12F5                          
5CBF- 8D 00 13             STA   $1300                          
5CC2- 60                   RTS                                  
5CC3- 02 C9                ???   $C9                            
5CC5- D2 C4                CMP   ($C4)                          
5CC7- D3                   ???                                  
5CC8- A0 02                LDY   #$02                           
5CCA- C5 D4                CMP   $D4                            
5CCC- D4 C5                ???   $C5                            
5CCE- D2 A0                CMP   ($A0)                          
5CD0- 02 D9                ???   $D9                            
5CD2- C5 8D                CMP   $8D                            
5CD4- 00                   BRK                                  
5CD5- C3                   ???                                  
5CD6- D2 A0                CMP   ($A0)                          
5CD8- C5 D3                CMP   $D3                            
5CDA- C3                   ???                                  
5CDB- A0 D4                LDY   #$D4                           
5CDD- C1 C2                CMP   ($C2,X)                        
5CDF- A0 D3                LDY   #$D3                           
5CE1- D0 C1                BNE   L5CA4                          
5CE3- C3                   ???                                  
5CE4- C5 8D                CMP   $8D                            
5CE6- 8D 00 03             STA   $0300                          
5CE9- 80 02                BRA   L5CED                          
5CEB- 00                   BRK                                  
5CEC- 18                   CLC                                  
5CED- 00        L5CED      BRK                                  
5CEE- 01 00                ORA   ($00,X)                        
5CF0- 02 60                ???   $60                            
5CF2- 81 02                STA   ($02,X)                        
5CF4- 04 00                TSB   $00                            
5CF6- 00                   BRK                                  
5CF7- 20 00 00             JSR   $0000                          
5CFA- 00                   BRK                                  
5CFB- 00                   BRK                                  
5CFC- 01 80                ORA   ($80,X)                        
5CFE- 02 02                ???   $02                            
5D00- D8                   CLD                                  
5D01- AD 82 C0             LDA   PHASE1OFF                      
5D04- A9 00                LDA   #$00                           
5D06- 8D F2 03             STA   DOSRESET                       
5D09- A9 10                LDA   #$10                           
5D0B- 8D F3 03             STA   $03F3                          
5D0E- 20 6F FB             JSR   $FB6F                          
5D11- A9 A0                LDA   #$A0                           
5D13- 20 00 C3             JSR   $C300                          
5D16- A2 17                LDX   #$17                           
5D18- A9 00                LDA   #$00                           
5D1A- 9D 58 BF  L5D1A      STA   $BF58,X                        
5D1D- CA                   DEX                                  
5D1E- 10 FA                BPL   L5D1A                          
5D20- EE 6F BF             INC   $BF6F                          
5D23- A9 CF                LDA   #$CF                           
5D25- 8D 58 BF             STA   $BF58                          
5D28- A9 02                LDA   #$02                           
5D2A- 85 E0                STA   XO                             
5D2C- AE 31 BF             LDX   $BF31                          
5D2F- 86 E5                STX   $E5                            
5D31- AD 30 BF             LDA   $BF30                          
5D34- D0 10                BNE   L5D46                          
5D36- A6 E5                LDX   $E5                            
5D38- BD 32 BF             LDA   $BF32,X                        
5D3B- E0 01                CPX   #$01                           
5D3D- B0 04                BCS   L5D43                          
5D3F- AE 31 BF             LDX   $BF31                          
5D42- E8                   INX                                  
5D43- CA        L5D43      DEX                                  
5D44- 86 E5                STX   $E5                            
5D46- 8D EF 12  L5D46      STA   $12EF                          
5D49- 20 00 BF             JSR   MLI                            
5D4C- C5 EE                CMP   $EE                            
5D4E- 12 B0                ORA   ($B0)                          
5D50- 22 AD                ???   $AD                            
5D52- 81 02                STA   ($02,X)                        
5D54- 29 0F                AND   #$0F                           
5D56- F0 1B                BEQ   L5D73                          
5D58- 69 02                ADC   #$02                           
5D5A- AA                   TAX                                  
5D5B- 8E 80 02             STX   $0280                          
5D5E- A9 2F                LDA   #$2F                           
5D60- 8D 81 02             STA   $0281                          
5D63- 9D 80 02             STA   $0280,X                        
5D66- A9 00                LDA   #$00                           
5D68- 9D 81 02             STA   $0281,X                        
5D6B- 85 E8                STA   $E8                            
5D6D- 20 00 BF             JSR   MLI                            
5D70- C8                   INY                                  
5D71- E6 12                INC   $12                            
5D73- B0 64     L5D73      BCS   L5DD9                          
5D75- AD EB 12             LDA   $12EB                          
5D78- 8D F6 12             STA   $12F6                          
5D7B- 85 E1                STA   $E1                            
5D7D- A9 2B                LDA   #$2B                           
5D7F- 8D F9 12             STA   $12F9                          
5D82- A9 00                LDA   #$00                           
5D84- 8D FA 12             STA   $12FA                          
5D87- 20 AE 12             JSR   $12AE                          
5D8A- B0 4D                BCS   L5DD9                          
5D8C- A2 03                LDX   #$03                           
5D8E- BD 23 20  L5D8E      LDA   L2023,X                        
5D91- 95 ED                STA   $ED,X                          
5D93- CA                   DEX                                  
5D94- 10 F8                BPL   L5D8E                          
5D96- 8D F9 12             STA   $12F9                          
5D99- A9 01                LDA   #$01                           
5D9B- 85 F1                STA   $F1                            
5D9D- A9 00                LDA   #$00                           
5D9F- 85 E3                STA   $E3                            
5DA1- 85 E4                STA   $E4                            
5DA3- A5 EF                LDA   $EF                            
5DA5- 05 F0                ORA   $F0                            
5DA7- D0 03                BNE   L5DAC                          
5DA9- 4C 20 11  L5DA9      JMP   $1120                          
5DAC- 24 F0     L5DAC      BIT   $F0                            
5DAE- 30 F9                BMI   L5DA9                          
5DB0- A5 E3     L5DB0      LDA   $E3                            
5DB2- 29 FE                AND   #$FE                           
5DB4- 85 E3                STA   $E3                            
5DB6- A4 F1                LDY   $F1                            
5DB8- A9 00                LDA   #$00                           
5DBA- C4 EE                CPY   $EE                            
5DBC- 90 07                BCC   L5DC5                          
5DBE- A8                   TAY                                  
5DBF- 84 F1                STY   $F1                            
5DC1- E6 E3                INC   $E3                            
5DC3- E6 E3     L5DC3      INC   $E3                            
5DC5- 88        L5DC5      DEY                                  
5DC6- 18                   CLC                                  
5DC7- 30 06                BMI   L5DCF                          
5DC9- 65 ED                ADC   $ED                            
5DCB- 90 F8                BCC   L5DC5                          
5DCD- B0 F4                BCS   L5DC3                          
5DCF- 69 04     L5DCF      ADC   #$04                           
5DD1- 85 E2                STA   YO                             
5DD3- 20 00 BF             JSR   MLI                            
5DD6- CE E0 00             DEC   XO                             
5DD9- B0 42     L5DD9      BCS   L5E1D                          
5DDB- 20 AE 12             JSR   $12AE                          
5DDE- B0 3D                BCS   L5E1D                          
5DE0- E6 F1                INC   $F1                            
5DE2- AD 00 20             LDA   L2000                          
5DE5- 29 F0                AND   #$F0                           
5DE7- F0 C7                BEQ   L5DB0                          
5DE9- C6 EF                DEC   $EF                            
5DEB- D0 02                BNE   L5DEF                          
5DED- C6 F0                DEC   $F0                            
5DEF- 6E 1E 20  L5DEF      ROR   L201E                          
5DF2- 90 B8                BCC   L5DAC                          
5DF4- AD 10 20             LDA   L2010                          
5DF7- C9 0F                CMP   #$0F                           
5DF9- F0 04                BEQ   L5DFF                          
5DFB- C9 FF                CMP   #$FF                           
5DFD- D0 AD                BNE   L5DAC                          
5DFF- A6 E8     L5DFF      LDX   $E8                            
5E01- E0 80                CPX   #$80                           
5E03- B0 1B                BCS   L5E20                          
5E05- 95 60                STA   $60,X                          
5E07- 20 4D 12             JSR   $124D                          
5E0A- A0 0F                LDY   #$0F                           
5E0C- B9 00 20  L5E0C      LDA   L2000,Y                        
5E0F- 91 EB                STA   ($EB),Y                        
5E11- 88                   DEY                                  
5E12- 10 F8                BPL   L5E0C                          
5E14- C8                   INY                                  
5E15- 29 0F                AND   #$0F                           
5E17- 91 EB                STA   ($EB),Y                        
5E19- E6 E8                INC   $E8                            
5E1B- D0 8F                BNE   L5DAC                          
5E1D- 4C 36 10  L5E1D      JMP   $1036                          
5E20- 20 00 BF  L5E20      JSR   MLI                            
5E23- CC EC 12             CPY   $12EC                          
5E26- B0 F5                BCS   L5E1D                          
5E28- 20 39 FB             JSR   $FB39                          
5E2B- 20 58 FC             JSR   HOME                           
5E2E- A9 17                LDA   #$17                           
5E30- 20 5B FB             JSR   $FB5B                          
5E33- A0 00                LDY   #$00                           
5E35- A9 14                LDA   #$14                           
5E37- 20 3F 12             JSR   $123F                          
5E3A- 20 A7 12             JSR   $12A7                          
5E3D- A2 00                LDX   #$00                           
5E3F- BD 81 02  L5E3F      LDA   $0281,X                        
5E42- F0 06                BEQ   L5E4A                          
5E44- 20 A9 12             JSR   $12A9                          
5E47- E8                   INX                                  
5E48- D0 F5                BNE   L5E3F                          
5E4A- A9 00     L5E4A      LDA   #$00                           
5E4C- 85 E7                STA   $E7                            
5E4E- 85 F2                STA   $F2                            
5E50- A5 E8                LDA   $E8                            
5E52- F0 57                BEQ   L5EAB                          
5E54- C9 15                CMP   #$15                           
5E56- 90 02                BCC   L5E5A                          
5E58- A9 14                LDA   #$14                           
5E5A- 85 EA     L5E5A      STA   $EA                            
5E5C- A9 02                LDA   #$02                           
5E5E- 85 22                STA   WNDTOP                         
5E60- 85 20                STA   WNDLFT                         
5E62- A9 16                LDA   #$16                           
5E64- 85 21                STA   WNDWDTH                        
5E66- 85 23                STA   WNDBTM                         
5E68- 20 6E 12  L5E68      JSR   $126E                          
5E6B- E6 E7                INC   $E7                            
5E6D- C6 EA                DEC   $EA                            
5E6F- D0 F7                BNE   L5E68                          
5E71- A9 00                LDA   #$00                           
5E73- 85 E7                STA   $E7                            
5E75- F0 2E                BEQ   L5EA5                          
5E77- 20 6E 12  L5E77      JSR   $126E                          
5E7A- A6 E7                LDX   $E7                            
5E7C- F0 27                BEQ   L5EA5                          
5E7E- C6 E7                DEC   $E7                            
5E80- A5 25                LDA   CV                             
5E82- C9 02                CMP   #$02                           
5E84- D0 1F                BNE   L5EA5                          
5E86- C6 F2                DEC   $F2                            
5E88- A9 16                LDA   #$16                           
5E8A- D0 16                BNE   L5EA2                          
5E8C- 20 6E 12  L5E8C      JSR   $126E                          
5E8F- A6 E7                LDX   $E7                            
5E91- E8                   INX                                  
5E92- E4 E8                CPX   $E8                            
5E94- B0 0F                BCS   L5EA5                          
5E96- 86 E7                STX   $E7                            
5E98- A5 25                LDA   CV                             
5E9A- C9 15                CMP   #$15                           
5E9C- D0 07                BNE   L5EA5                          
5E9E- E6 F2                INC   $F2                            
5EA0- A9 17                LDA   #$17                           
5EA2- 20 ED FD  L5EA2      JSR   COUT                           
5EA5- 20 80 FE  L5EA5      JSR   SETINV                         
5EA8- 20 6E 12             JSR   $126E                          
5EAB- AD 00 C0  L5EAB      LDA   KBD                            
5EAE- 10 FB                BPL   L5EAB                          
5EB0- 8D 10 C0             STA   KBDSTRB                        
5EB3- 20 84 FE             JSR   SETNORM                        
5EB6- A6 E8                LDX   $E8                            
5EB8- F0 0C                BEQ   L5EC6                          
5EBA- C9 8D                CMP   #$8D                           
5EBC- F0 2B                BEQ   L5EE9                          
5EBE- C9 8A                CMP   #$8A                           
5EC0- F0 CA                BEQ   L5E8C                          
5EC2- C9 8B                CMP   #$8B                           
5EC4- F0 B1                BEQ   L5E77                          
5EC6- C9 89     L5EC6      CMP   #$89                           
5EC8- F0 18                BEQ   L5EE2                          
5ECA- C9 9B                CMP   #$9B                           
5ECC- D0 DD                BNE   L5EAB                          
5ECE- AE 80 02             LDX   $0280                          
5ED1- CA        L5ED1      DEX                                  
5ED2- BD 80 02             LDA   $0280,X                        
5ED5- C9 2F                CMP   #$2F                           
5ED7- D0 F8                BNE   L5ED1                          
5ED9- E0 01                CPX   #$01                           
5EDB- D0 09                BNE   L5EE6                          
5EDD- AE 80 02             LDX   $0280                          
5EE0- D0 04                BNE   L5EE6                          
5EE2- 4C 36 10  L5EE2      JMP   $1036                          
5EE5- E8        L5EE5      INX                                  
5EE6- 4C 5B 10  L5EE6      JMP   $105B                          
5EE9- 20 00 BF  L5EE9      JSR   MLI                            
5EEC- C6 F2                DEC   $F2                            
5EEE- 12 B0                ORA   ($B0)                          
5EF0- F1 A6                SBC   ($A6),Y                        
5EF2- E7 20                ???   WNDLFT                         
5EF4- 4D 12 AE             EOR   $AE12                          
5EF7- 80 02                BRA   L5EFB                          
5EF9- C8        L5EF9      INY                                  
5EFA- B1 EB                LDA   ($EB),Y                        
5EFC- E8                   INX                                  
5EFD- 9D 80 02             STA   $0280,X                        
5F00- C4 E9                CPY   $E9                            
5F02- 90 F5                BCC   L5EF9                          
5F04- 8E 80 02             STX   $0280                          
5F07- A4 E7                LDY   $E7                            
5F09- B9 60 00             LDA   $0060,Y                        
5F0C- 10 D7                BPL   L5EE5                          
5F0E- 20 00 BF             JSR   MLI                            
5F11- C8                   INY                                  
5F12- E6 12                INC   $12                            
5F14- B0 CC                BCS   L5EE2                          
5F16- AD EB 12             LDA   $12EB                          
5F19- 8D F6 12             STA   $12F6                          
5F1C- A9 FF                LDA   #$FF                           
5F1E- 8D F9 12             STA   $12F9                          
5F21- 8D FA 12             STA   $12FA                          
5F24- 20 AE 12             JSR   $12AE                          
5F27- 08                   PHP                                  
5F28- 20 00 BF             JSR   MLI                            
5F2B- CC EC 12             CPY   $12EC                          
5F2E- 28                   PLP                                  
5F2F- B0 B1                BCS   L5EE2                          
5F31- 20 39 FB             JSR   $FB39                          
5F34- 20 58 FC             JSR   HOME                           
5F37- A9 95                LDA   #$95                           
5F39- 20 ED FD             JSR   COUT                           
5F3C- 4C 00 20             JMP   L2000                          
5F3F- 85 24                STA   CH                             
5F41- B9 B5 12  L5F41      LDA   $12B5,Y                        
5F44- F0 06                BEQ   L5F4C                          
5F46- 20 ED FD             JSR   COUT                           
5F49- C8                   INY                                  
5F4A- D0 F5                BNE   L5F41                          
5F4C- 60        L5F4C      RTS                                  
5F4D- A9 00                LDA   #$00                           
5F4F- 85 EC                STA   $EC                            
5F51- 8A                   TXA                                  
5F52- 0A                   ASL                                  
5F53- 26 EC                ROL   $EC                            
5F55- 0A                   ASL                                  
5F56- 26 EC                ROL   $EC                            
5F58- 0A                   ASL                                  
5F59- 26 EC                ROL   $EC                            
5F5B- 0A                   ASL                                  
5F5C- 26 EC                ROL   $EC                            
5F5E- 85 EB                STA   $EB                            
5F60- A9 14                LDA   #$14                           
5F62- 18                   CLC                                  
5F63- 65 EC                ADC   $EC                            
5F65- 85 EC                STA   $EC                            
5F67- A0 00                LDY   #$00                           
5F69- B1 EB                LDA   ($EB),Y                        
5F6B- 85 E9                STA   $E9                            
5F6D- 60                   RTS                                  
5F6E- A9 02                LDA   #$02                           
5F70- 8D 7B 05             STA   $057B                          
5F73- A6 E7                LDX   $E7                            
5F75- 8A                   TXA                                  
5F76- 38                   SEC                                  
5F77- E5 F2                SBC   $F2                            
5F79- 18                   CLC                                  
5F7A- 69 02                ADC   #$02                           
5F7C- 20 5B FB             JSR   $FB5B                          
5F7F- B5 60                LDA   $60,X                          
5F81- 30 10                BMI   L5F93                          
5F83- A9 00                LDA   #$00                           
5F85- 8D 7B 05             STA   $057B                          
5F88- A5 32                LDA   $32                            
5F8A- 48                   PHA                                  
5F8B- A0 2A                LDY   #$2A                           
5F8D- 20 41 12             JSR   $1241                          
5F90- 68                   PLA                                  
5F91- 85 32                STA   $32                            
5F93- 20 A3 12  L5F93      JSR   $12A3                          
5F96- 20 4D 12             JSR   $124D                          
5F99- C8        L5F99      INY                                  
5F9A- B1 EB                LDA   ($EB),Y                        
5F9C- 20 A9 12             JSR   $12A9                          
5F9F- C4 E9                CPY   $E9                            
5FA1- 90 F6                BCC   L5F99                          
5FA3- A9 A0                LDA   #$A0                           
5FA5- D0 04                BNE   L5FAB                          
5FA7- A9 99                LDA   #$99                           
5FA9- 09 80                ORA   #$80                           
5FAB- 4C ED FD  L5FAB      JMP   COUT                           
5FAE- 20 00 BF             JSR   MLI                            
5FB1- CA                   DEX                                  
5FB2- F5 12                SBC   $12,X                          
5FB4- 60                   RTS                                  
5FB5- D2 C5                CMP   ($C5)                          
5FB7- D4 D5                ???   $D5                            
5FB9- D2 CE                CMP   ($CE)                          
5FBB- BA                   TSX                                  
5FBC- A0 D3                LDY   #$D3                           
5FBE- E5 EC                SBC   $EC                            
5FC0- E5 E3                SBC   $E3                            
5FC2- F4 A0                ???   $A0                            
5FC4- FC A0 D4             ???   $D4A0                          
5FC7- C1 C2                CMP   ($C2,X)                        
5FC9- BA                   TSX                                  
5FCA- A0 C3                LDY   #$C3                           
5FCC- E8                   INX                                  
5FCD- E7 A0                ???   $A0                            
5FCF- D6 EF                DEC   $EF,X                          
5FD1- EC A0 FC             CPX   $FCA0                          
5FD4- A0 C5                LDY   #$C5                           
5FD6- D3                   ???                                  
5FD7- C3                   ???                                  
5FD8- BA                   TSX                                  
5FD9- A0 C2                LDY   #$C2                           
5FDB- E1 E3                SBC   ($E3,X)                        
5FDD- EB                   ???                                  
5FDE- 00                   BRK                                  
5FDF- 0F 1B     L5FDF      ???   L5FFC                          
5FE1- D8                   CLD                                  
5FE2- D9 18 0E             CMP   $0E18,Y                        
5FE5- 00                   BRK                                  
5FE6- 03                   ???                                  
5FE7- 80 02                BRA   L5FEB                          
5FE9- 00                   BRK                                  
5FEA- 1C 00 01             TRB   $0100                          
5FED- 00                   BRK                                  
5FEE- 02 60                ???   $60                            
5FF0- 81 02                STA   ($02,X)                        
5FF2- 01 80                ORA   ($80,X)                        
5FF4- 02 04                ???   $04                            
5FF6- 01 00                ORA   ($00,X)                        
5FF8- 20 00 00             JSR   $0000                          
5FFB- 00                   BRK                                  
5FFC- 00        L5FFC      BRK                                  
5FFD- 47 41                ???   A3H                            
5FFF- 42 E2                ???   YO                             
6001- 30 AD                BMI   L5FB0                          
6003- 68                   PLA                                  
6004- C0 8D                CPY   #$8D                           
6006- 90 D7                BCC   L5FDF                          
6008- 29 CF                AND   #$CF                           
600A- 8D 68 C0             STA   $C068                          
600D- 18                   CLC                                  
600E- FB                   ???                                  
600F- C2 30                ???   COLOR                          
6011- A9 00                LDA   #$00                           
6013- 00                   BRK                                  
6014- 48                   PHA                                  
6015- 48                   PHA                                  
6016- 48                   PHA                                  
6017- 48                   PHA                                  
6018- A2 03                LDX   #$03                           
601A- 0D 22 00             ORA   WNDTOP                         
601D- 00                   BRK                                  
601E- E1 E2                SBC   (YO,X)                         
6020- 20 AD 90             JSR   $90AD                          
6023- D7 8D                ???   $8D                            
6025- 68                   PLA                                  
6026- C0 68                CPY   #$68                           
6028- 68                   PLA                                  
6029- 8D 92 BF             STA   $BF92                          
602C- 68                   PLA                                  
602D- 8D 93 BF             STA   $BF93                          
6030- 68                   PLA                                  
6031- 8D 91 BF             STA   $BF91                          
6034- 68                   PLA                                  
6035- 1A                   INC                                  
6036- 8D 90 BF             STA   $BF90                          
6039- 68                   PLA                                  
603A- 1A                   INC                                  
603B- 0A                   ASL                                  
603C- 0A                   ASL                                  
603D- 0A                   ASL                                  
603E- 0A                   ASL                                  
603F- 0A                   ASL                                  
6040- 0D 90 BF             ORA   $BF90                          
6043- 8D 90 BF             STA   $BF90                          
6046- 2E 91 BF             ROL   $BF91                          
6049- 68                   PLA                                  
604A- 68                   PLA                                  
604B- 38                   SEC                                  
604C- FB                   ???                                  
604D- 60                   RTS                                  
604E- 00                   BRK                                  
604F- 4A                   LSR                                  
6050- 49 4D                EOR   #$4D                           
6052- 4A                   LSR                                  
6053- 41 59                EOR   ($59,X)                        
6055- 4B                   ???                                  
6056- 45 52                EOR   $52                            
6058- 52 59                EOR   ($59)                          
605A- 26 4D                ROL   $4D                            
605C- 49 4B                EOR   #$4B                           
605E- 45 00                EOR   $00                            
6060- 00        L6060      BRK                                  
6061- 00                   BRK                                  
6062- 00                   BRK                                  
6063- 00                   BRK                                  
6064- 00                   BRK                                  
6065- 00                   BRK                                  
6066- 00                   BRK                                  
6067- 00                   BRK                                  
6068- 00                   BRK                                  
6069- 00                   BRK                                  
606A- 00                   BRK                                  
606B- 00                   BRK                                  
606C- 00                   BRK                                  
606D- 00                   BRK                                  
606E- 00                   BRK                                  
606F- 00                   BRK                                  
6070- 00                   BRK                                  
6071- 00                   BRK                                  
6072- 00                   BRK                                  
6073- 00                   BRK                                  
6074- 00                   BRK                                  
6075- 00                   BRK                                  
6076- 00                   BRK                                  
6077- 00                   BRK                                  
6078- 00                   BRK                                  
6079- 00                   BRK                                  
607A- 00                   BRK                                  
607B- 00                   BRK                                  
607C- 00                   BRK                                  
