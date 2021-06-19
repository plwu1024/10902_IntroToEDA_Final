// Benchmark "top" written by ABC on Sun Jun 20 01:22:40 2021

module top ( 
    clk, oe, \a[0] , \a[1] , \a[2] , \a[3] , \a[4] , \a[5] , \a[6] ,
    \a[7] , \b[0] , \b[1] , \b[2] , \b[3] , \b[4] , \b[5] , \b[6] , \b[7] ,
    \op[0] , \op[1] ,
    \y[0] , \y[1] , \y[2] , \y[3] , \y[4] , \y[5] , \y[6] , \y[7] , parity,
    overflow, greater, is_eq, less  );
  input  clk, oe, \a[0] , \a[1] , \a[2] , \a[3] , \a[4] , \a[5] , \a[6] ,
    \a[7] , \b[0] , \b[1] , \b[2] , \b[3] , \b[4] , \b[5] , \b[6] , \b[7] ,
    \op[0] , \op[1] ;
  output \y[0] , \y[1] , \y[2] , \y[3] , \y[4] , \y[5] , \y[6] , \y[7] ,
    parity, overflow, greater, is_eq, less;
  wire new_n_505_, new_wc_, new_n_506_, new_wc0_, new_n_473_, new_wc1_,
    new_n_474_, new_wc2_, new_n_481_, new_wc3_, new_n_482_, new_wc4_,
    new_n_489_, new_wc5_, new_n_490_, new_wc6_, new_n_515_, new_wc7_,
    new_n_537_, new_n_539_, new_n_541_, new_n_542_, new_n_543_, new_n_545_,
    new_n_546_, new_n_547_, new_n_535_, new_wc8_, new_n_534_, new_wc9_,
    new_n_549_, new_wc10_, new_n_544_, new_wc11_, new_n_558_, new_wc12_,
    new_n_565_, new_n_567_, new_n_569_, new_n_571_, new_n_573_, new_n_803_,
    new_wc13_, new_n_804_, new_wc14_, new_n_810_, new_wc15_, new_n_811_,
    new_wc16_, new_n_510_, new_n_513_, new_n_814_, new_wc17_, new_n_815_,
    new_wc18_, new_n_502_, new_n_501_, new_wc19_, new_n_753_, new_n_816_,
    new_wc20_, new_n_817_, new_wc21_, new_n_509_, new_n_751_, new_n_752_,
    new_n_744_, new_n_512_, new_n_818_, new_wc22_, new_n_819_, new_wc23_,
    new_n_494_, new_n_741_, new_wc24_, new_n_504_, new_wc25_, new_n_820_,
    new_n_821_, new_n_568_, new_n_729_, new_n_822_, new_wc26_, new_n_823_,
    new_wc27_, new_n_493_, new_n_771_, new_n_726_, new_wc28_, new_n_488_,
    new_wc29_, new_n_498_, new_n_774_, new_n_827_, new_n_828_, new_n_564_,
    new_n_714_, new_n_517_, new_n_520_, new_n_711_, new_wc30_, new_n_492_,
    new_wc31_, new_n_497_, new_n_636_, new_wc32_, new_n_699_, new_n_765_,
    new_n_648_, new_wc33_, new_n_829_, new_n_830_, new_n_572_, new_n_647_,
    new_wc34_, new_n_480_, new_wc35_, new_n_485_, new_n_696_, new_wc36_,
    new_n_635_, new_wc37_, new_n_646_, new_n_508_, new_wc38_, new_n_669_,
    new_n_634_, new_n_768_, new_n_831_, new_n_832_, new_n_570_, new_n_645_,
    new_n_484_, new_n_684_, new_n_633_, new_n_666_, new_wc39_, new_n_651_,
    new_n_681_, new_wc40_, new_n_575_, new_n_654_, new_n_833_, new_n_834_,
    new_n_566_, new_n_576_, new_n_762_, new_n_557_, new_wc41_, new_n_624_,
    new_wc42_, new_n_479_, new_n_835_, new_n_836_, new_n_574_, new_n_615_,
    new_n_560_, new_wc43_, new_n_777_, new_n_503_, new_n_507_, new_n_697_,
    new_wc44_, new_n_682_, new_wc45_, new_n_500_, new_n_614_, new_n_742_,
    new_wc46_, new_n_487_, new_n_613_, new_wc47_, new_n_495_, new_n_476_,
    new_n_623_, new_n_622_, new_n_712_, new_wc48_, new_n_556_, new_n_559_,
    new_n_603_, new_n_606_, new_n_667_, new_wc49_, new_n_491_, new_n_594_,
    new_n_743_, new_n_597_, new_n_759_, new_n_713_, new_n_758_, new_n_728_,
    new_n_727_, new_wc50_, new_n_683_, new_n_588_, new_n_478_, new_n_698_,
    new_n_600_, new_n_516_, new_n_591_, new_n_585_, new_n_519_, new_n_555_,
    new_wc51_, new_n_668_, new_n_837_, new_wc52_, new_n_838_, new_wc53_,
    new_n_483_, new_n_695_, new_n_839_, new_wc54_, new_n_840_, new_wc55_,
    new_n_486_, new_n_710_, new_n_841_, new_wc56_, new_n_842_, new_wc57_,
    new_n_562_, new_n_740_, new_n_843_, new_wc58_, new_n_844_, new_wc59_,
    new_n_499_, new_n_472_, new_n_845_, new_wc60_, new_n_846_, new_wc61_,
    new_n_496_, new_n_725_, new_n_518_, new_wc62_, new_n_563_, new_n_680_,
    new_n_582_, new_n_581_, new_wc63_, new_n_849_, new_wc64_, new_n_850_,
    new_wc65_, new_n_477_, new_n_851_, new_wc66_, new_n_852_, new_wc67_,
    new_n_475_, new_n_471_, new_wc68_, new_n_665_, new_wc69_, new_wc70_,
    new_wc71_, new_wc72_, new_wc73_, new_wc74_, new_wc75_, new_wc76_,
    new_wc77_, new_t_0_, new_t_2_, new_t_4_, new_t_6_;
  assign overflow = \y[7] ;
  assign new_wc_ = ~\b[1] ;
  assign new_n_505_ = new_wc_ | \a[1] ;
  assign new_n_506_ = \b[1]  | new_wc0_;
  assign new_wc0_ = ~\a[1] ;
  assign new_n_473_ = \b[2]  | new_wc1_;
  assign new_wc1_ = ~\a[2] ;
  assign new_n_474_ = new_wc2_ | \a[2] ;
  assign new_wc2_ = ~\b[2] ;
  assign new_n_481_ = \b[4]  | new_wc3_;
  assign new_wc3_ = ~\a[4] ;
  assign new_n_482_ = new_wc4_ | \a[4] ;
  assign new_wc4_ = ~\b[4] ;
  assign new_n_489_ = new_wc5_ | \a[3] ;
  assign new_wc5_ = ~\b[3] ;
  assign new_n_490_ = \b[3]  | new_wc6_;
  assign new_wc6_ = ~\a[3] ;
  assign \y[7]  = ~new_n_513_;
  assign new_n_515_ = \b[5]  | new_wc7_;
  assign new_wc7_ = ~\a[5] ;
  assign new_n_537_ = ~new_n_473_ | ~new_n_506_;
  assign new_n_539_ = ~new_n_474_ | ~new_n_505_;
  assign new_n_541_ = \a[2]  | new_n_475_;
  assign new_n_542_ = new_n_483_ | \a[3] ;
  assign new_n_543_ = new_n_477_ | \a[1] ;
  assign new_n_545_ = \a[4]  | new_n_486_;
  assign new_n_546_ = new_n_499_ | \a[6] ;
  assign new_n_547_ = new_n_496_ | \a[5] ;
  assign new_n_535_ = new_wc8_ | \a[6] ;
  assign new_wc8_ = ~\b[6] ;
  assign new_n_534_ = \b[6]  | new_wc9_;
  assign new_wc9_ = ~\a[6] ;
  assign new_n_549_ = \b[7]  | new_wc10_;
  assign new_wc10_ = ~\a[7] ;
  assign new_n_544_ = new_wc11_ | \a[7] ;
  assign new_wc11_ = ~\b[7] ;
  assign new_n_558_ = new_n_482_ | new_wc12_;
  assign new_wc12_ = ~new_n_515_;
  assign new_n_565_ = ~new_n_473_ | ~new_n_474_;
  assign new_n_567_ = ~new_n_535_ | ~new_n_534_;
  assign new_n_569_ = ~new_n_489_ | ~new_n_490_;
  assign new_n_571_ = ~new_n_481_ | ~new_n_482_;
  assign new_n_573_ = ~new_n_505_ | ~new_n_506_;
  assign new_n_803_ = new_wc13_ | new_n_510_;
  assign new_wc13_ = ~new_n_494_;
  assign new_n_804_ = new_n_494_ | new_wc14_;
  assign new_wc14_ = ~new_n_510_;
  assign parity = ~new_n_803_ | ~new_n_804_;
  assign new_n_810_ = new_wc15_ | new_n_509_;
  assign new_wc15_ = ~new_n_502_;
  assign new_n_811_ = new_n_502_ | new_wc16_;
  assign new_wc16_ = ~new_n_509_;
  assign new_n_510_ = ~new_n_810_ | ~new_n_811_;
  assign new_n_513_ = new_n_753_ | \op[1] ;
  assign new_n_814_ = new_wc17_ | new_n_501_;
  assign new_wc17_ = ~new_n_495_;
  assign new_n_815_ = new_n_495_ | new_wc18_;
  assign new_wc18_ = ~new_n_501_;
  assign new_n_502_ = ~new_n_814_ | ~new_n_815_;
  assign new_n_501_ = new_wc19_ | new_n_744_;
  assign new_wc19_ = ~new_n_743_;
  assign new_n_753_ = ~new_n_751_ | ~new_n_752_;
  assign new_n_816_ = new_wc20_ | new_n_508_;
  assign new_wc20_ = ~new_n_504_;
  assign new_n_817_ = new_n_504_ | new_wc21_;
  assign new_wc21_ = ~new_n_508_;
  assign new_n_509_ = ~new_n_816_ | ~new_n_817_;
  assign new_n_751_ = new_n_512_ | \op[0] ;
  assign new_n_752_ = ~new_n_512_ | ~\op[0] ;
  assign new_n_744_ = ~new_n_741_ | ~new_n_742_;
  assign new_n_512_ = ~new_n_594_ | ~new_n_771_;
  assign new_n_818_ = new_wc22_ | new_n_493_;
  assign new_wc22_ = ~new_n_480_;
  assign new_n_819_ = new_n_480_ | new_wc23_;
  assign new_wc23_ = ~new_n_493_;
  assign new_n_494_ = ~new_n_818_ | ~new_n_819_;
  assign new_n_741_ = new_wc24_ | \op[1] ;
  assign new_wc24_ = ~new_n_568_;
  assign new_n_504_ = new_wc25_ | new_n_729_;
  assign new_wc25_ = ~new_n_728_;
  assign new_n_820_ = ~new_n_500_ | ~new_n_498_;
  assign new_n_821_ = new_n_500_ | new_n_498_;
  assign new_n_568_ = ~new_n_820_ | ~new_n_821_;
  assign new_n_729_ = ~new_n_726_ | ~new_n_727_;
  assign new_n_822_ = new_wc26_ | new_n_492_;
  assign new_wc26_ = ~new_n_488_;
  assign new_n_823_ = new_n_488_ | new_wc27_;
  assign new_wc27_ = ~new_n_492_;
  assign new_n_493_ = ~new_n_822_ | ~new_n_823_;
  assign new_n_771_ = ~new_n_546_ | ~new_n_498_;
  assign new_n_726_ = new_wc28_ | \op[1] ;
  assign new_wc28_ = ~new_n_564_;
  assign new_n_488_ = new_wc29_ | new_n_714_;
  assign new_wc29_ = ~new_n_713_;
  assign new_n_498_ = ~new_n_597_ | ~new_n_774_;
  assign new_n_774_ = ~new_n_547_ | ~new_n_497_;
  assign new_n_827_ = ~new_n_503_ | ~new_n_497_;
  assign new_n_828_ = new_n_503_ | new_n_497_;
  assign new_n_564_ = ~new_n_827_ | ~new_n_828_;
  assign new_n_714_ = ~new_n_711_ | ~new_n_712_;
  assign new_n_517_ = new_n_636_ | new_n_516_;
  assign new_n_520_ = new_n_648_ | new_n_519_;
  assign new_n_711_ = new_wc30_ | \op[1] ;
  assign new_wc30_ = ~new_n_572_;
  assign new_n_492_ = new_wc31_ | new_n_699_;
  assign new_wc31_ = ~new_n_698_;
  assign new_n_497_ = ~new_n_588_ | ~new_n_765_;
  assign new_n_636_ = new_n_635_ | new_wc32_;
  assign new_wc32_ = ~new_n_515_;
  assign new_n_699_ = ~new_n_696_ | ~new_n_697_;
  assign new_n_765_ = ~new_n_545_ | ~new_n_485_;
  assign new_n_648_ = new_n_647_ | new_wc33_;
  assign new_wc33_ = ~new_n_518_;
  assign new_n_829_ = ~new_n_487_ | ~new_n_485_;
  assign new_n_830_ = new_n_487_ | new_n_485_;
  assign new_n_572_ = ~new_n_829_ | ~new_n_830_;
  assign new_n_647_ = new_n_646_ | new_wc34_;
  assign new_wc34_ = ~new_n_489_;
  assign new_n_480_ = new_wc35_ | new_n_669_;
  assign new_wc35_ = ~new_n_668_;
  assign new_n_485_ = ~new_n_591_ | ~new_n_768_;
  assign new_n_696_ = new_wc36_ | \op[1] ;
  assign new_wc36_ = ~new_n_570_;
  assign new_n_635_ = new_n_634_ | new_wc37_;
  assign new_wc37_ = ~new_n_490_;
  assign new_n_646_ = ~new_n_645_ | ~new_n_482_;
  assign new_n_508_ = new_wc38_ | new_n_684_;
  assign new_wc38_ = ~new_n_683_;
  assign new_n_669_ = ~new_n_666_ | ~new_n_667_;
  assign new_n_634_ = ~new_n_633_ | ~new_n_481_;
  assign new_n_768_ = ~new_n_542_ | ~new_n_484_;
  assign new_n_831_ = ~new_n_491_ | ~new_n_484_;
  assign new_n_832_ = new_n_491_ | new_n_484_;
  assign new_n_570_ = ~new_n_831_ | ~new_n_832_;
  assign new_n_645_ = ~new_n_576_ | ~new_n_490_;
  assign new_n_484_ = ~new_n_585_ | ~new_n_762_;
  assign new_n_684_ = ~new_n_681_ | ~new_n_682_;
  assign new_n_633_ = ~new_n_575_ | ~new_n_489_;
  assign new_n_666_ = new_wc39_ | \op[1] ;
  assign new_wc39_ = ~new_n_566_;
  assign new_n_651_ = ~new_n_557_ | ~new_n_556_;
  assign new_n_681_ = new_wc40_ | \op[1] ;
  assign new_wc40_ = ~new_n_574_;
  assign new_n_575_ = ~new_n_614_ | ~new_n_615_;
  assign new_n_654_ = ~new_n_560_ | ~new_n_559_;
  assign new_n_833_ = ~new_n_476_ | ~new_n_479_;
  assign new_n_834_ = new_n_476_ | new_n_479_;
  assign new_n_566_ = ~new_n_833_ | ~new_n_834_;
  assign new_n_576_ = ~new_n_623_ | ~new_n_624_;
  assign new_n_762_ = ~new_n_541_ | ~new_n_479_;
  assign new_n_557_ = new_n_519_ | new_wc41_;
  assign new_wc41_ = ~new_n_603_;
  assign new_n_624_ = new_n_622_ | new_wc42_;
  assign new_wc42_ = ~\b[0] ;
  assign new_n_479_ = ~new_n_600_ | ~new_n_777_;
  assign new_n_835_ = ~new_n_478_ | ~new_n_507_;
  assign new_n_836_ = new_n_478_ | new_n_507_;
  assign new_n_574_ = ~new_n_835_ | ~new_n_836_;
  assign new_n_615_ = new_n_613_ | \b[0] ;
  assign new_n_560_ = new_n_516_ | new_wc43_;
  assign new_wc43_ = ~new_n_606_;
  assign new_n_777_ = ~new_n_478_ | ~new_n_543_;
  assign new_n_503_ = ~new_n_547_ | ~new_n_597_;
  assign new_n_507_ = ~new_n_543_ | ~new_n_600_;
  assign new_n_697_ = new_wc44_ | new_n_472_;
  assign new_wc44_ = ~new_n_569_;
  assign new_n_682_ = new_wc45_ | new_n_472_;
  assign new_wc45_ = ~new_n_573_;
  assign new_n_500_ = ~new_n_546_ | ~new_n_594_;
  assign new_n_614_ = ~new_n_474_ | ~new_n_537_;
  assign new_n_742_ = new_wc46_ | new_n_472_;
  assign new_wc46_ = ~new_n_567_;
  assign new_n_487_ = ~new_n_545_ | ~new_n_588_;
  assign new_n_613_ = new_n_539_ | new_wc47_;
  assign new_wc47_ = ~\a[0] ;
  assign new_n_495_ = ~new_n_758_ | ~new_n_759_;
  assign new_n_476_ = ~new_n_541_ | ~new_n_585_;
  assign new_n_623_ = ~new_n_473_ | ~new_n_539_;
  assign new_n_622_ = new_n_537_ | \a[0] ;
  assign new_n_712_ = new_wc48_ | new_n_472_;
  assign new_wc48_ = ~new_n_571_;
  assign new_n_556_ = ~new_n_516_ | ~new_n_544_;
  assign new_n_559_ = ~new_n_519_ | ~new_n_549_;
  assign new_n_603_ = ~new_n_555_ | ~new_n_515_;
  assign new_n_606_ = ~new_n_558_ | ~new_n_518_;
  assign new_n_667_ = new_wc49_ | new_n_472_;
  assign new_wc49_ = ~new_n_565_;
  assign new_n_491_ = ~new_n_542_ | ~new_n_591_;
  assign new_n_594_ = ~new_n_499_ | ~\a[6] ;
  assign new_n_743_ = new_n_740_ | new_n_471_;
  assign new_n_597_ = ~new_n_496_ | ~\a[5] ;
  assign new_n_759_ = ~new_n_562_ | ~new_n_471_;
  assign new_n_713_ = new_n_710_ | new_n_471_;
  assign new_n_758_ = new_n_582_ | new_n_471_;
  assign new_n_728_ = new_n_725_ | new_n_471_;
  assign new_n_727_ = new_wc50_ | new_n_472_;
  assign new_wc50_ = ~new_n_563_;
  assign new_n_683_ = new_n_680_ | new_n_471_;
  assign new_n_588_ = ~new_n_486_ | ~\a[4] ;
  assign new_n_478_ = ~new_n_581_ | ~new_n_582_;
  assign new_n_698_ = new_n_695_ | new_n_471_;
  assign new_n_600_ = ~new_n_477_ | ~\a[1] ;
  assign new_n_516_ = ~new_n_549_ | ~new_n_534_;
  assign new_n_591_ = ~new_n_483_ | ~\a[3] ;
  assign new_n_585_ = ~new_n_475_ | ~\a[2] ;
  assign new_n_519_ = ~new_n_544_ | ~new_n_535_;
  assign new_n_555_ = new_n_481_ | new_wc51_;
  assign new_wc51_ = ~new_n_518_;
  assign new_n_668_ = new_n_665_ | new_n_471_;
  assign new_n_837_ = new_wc52_ | \b[3] ;
  assign new_wc52_ = ~\op[0] ;
  assign new_n_838_ = \op[0]  | new_wc53_;
  assign new_wc53_ = ~\b[3] ;
  assign new_n_483_ = ~new_n_837_ | ~new_n_838_;
  assign new_n_695_ = ~\b[3]  | ~\a[3] ;
  assign new_n_839_ = new_wc54_ | \b[4] ;
  assign new_wc54_ = ~\op[0] ;
  assign new_n_840_ = \op[0]  | new_wc55_;
  assign new_wc55_ = ~\b[4] ;
  assign new_n_486_ = ~new_n_839_ | ~new_n_840_;
  assign new_n_710_ = ~\b[4]  | ~\a[4] ;
  assign new_n_841_ = new_wc56_ | \b[0] ;
  assign new_wc56_ = ~\a[0] ;
  assign new_n_842_ = \a[0]  | new_wc57_;
  assign new_wc57_ = ~\b[0] ;
  assign new_n_562_ = ~new_n_841_ | ~new_n_842_;
  assign new_n_740_ = ~\b[6]  | ~\a[6] ;
  assign new_n_843_ = new_wc58_ | \b[6] ;
  assign new_wc58_ = ~\op[0] ;
  assign new_n_844_ = \op[0]  | new_wc59_;
  assign new_wc59_ = ~\b[6] ;
  assign new_n_499_ = ~new_n_843_ | ~new_n_844_;
  assign new_n_472_ = ~\op[1]  | ~\op[0] ;
  assign new_n_845_ = new_wc60_ | \b[5] ;
  assign new_wc60_ = ~\op[0] ;
  assign new_n_846_ = \op[0]  | new_wc61_;
  assign new_wc61_ = ~\b[5] ;
  assign new_n_496_ = ~new_n_845_ | ~new_n_846_;
  assign new_n_725_ = ~\b[5]  | ~\a[5] ;
  assign new_n_518_ = \a[5]  | new_wc62_;
  assign new_wc62_ = ~\b[5] ;
  assign new_n_563_ = ~new_n_515_ | ~new_n_518_;
  assign new_n_680_ = ~\b[1]  | ~\a[1] ;
  assign new_n_582_ = ~\a[0]  | ~\b[0] ;
  assign new_n_581_ = \b[0]  | new_wc63_;
  assign new_wc63_ = ~\op[0] ;
  assign new_n_849_ = new_wc64_ | \b[1] ;
  assign new_wc64_ = ~\op[0] ;
  assign new_n_850_ = \op[0]  | new_wc65_;
  assign new_wc65_ = ~\b[1] ;
  assign new_n_477_ = ~new_n_849_ | ~new_n_850_;
  assign new_n_851_ = new_wc66_ | \b[2] ;
  assign new_wc66_ = ~\op[0] ;
  assign new_n_852_ = \op[0]  | new_wc67_;
  assign new_wc67_ = ~\b[2] ;
  assign new_n_475_ = ~new_n_851_ | ~new_n_852_;
  assign new_n_471_ = new_wc68_ | \op[0] ;
  assign new_wc68_ = ~\op[1] ;
  assign new_n_665_ = ~\b[2]  | ~\a[2] ;
  assign is_eq = ~new_n_517_ & ~new_n_520_;
  assign less = new_wc69_ & new_n_520_;
  assign new_wc69_ = ~new_n_651_;
  assign greater = new_wc70_ & new_n_517_;
  assign new_wc70_ = ~new_n_654_;
  assign \y[5]  = new_n_504_ & new_wc71_;
  assign new_wc71_ = ~new_n_513_;
  assign \y[2]  = new_n_480_ & new_wc72_;
  assign new_wc72_ = ~new_n_513_;
  assign \y[1]  = new_n_508_ & new_wc73_;
  assign new_wc73_ = ~new_n_513_;
  assign \y[6]  = new_t_0_ & new_n_501_ & new_wc74_;
  assign new_wc74_ = ~new_n_513_;
  assign \y[4]  = new_t_2_ & new_n_488_ & new_wc75_;
  assign new_wc75_ = ~new_n_513_;
  assign \y[3]  = new_t_4_ & new_n_492_ & new_wc76_;
  assign new_wc76_ = ~new_n_513_;
  assign \y[0]  = new_t_6_ & new_n_495_ & new_wc77_;
  assign new_wc77_ = ~new_n_513_;
  assign new_t_0_ = 1'b0;
  assign new_t_2_ = 1'b0;
  assign new_t_4_ = 1'b0;
  assign new_t_6_ = 1'b0;
endmodule


