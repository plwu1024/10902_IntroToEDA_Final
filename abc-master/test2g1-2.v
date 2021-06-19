// Benchmark "top" written by ABC on Sun Jun 20 00:45:41 2021

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
  wire new_new_n_505__, new_new_wc__, new_new_n_506__, new_new_wc0__,
    new_new_n_473__, new_new_wc1__, new_new_n_474__, new_new_wc2__,
    new_new_n_481__, new_new_wc3__, new_new_n_482__, new_new_wc4__,
    new_new_n_489__, new_new_wc5__, new_new_n_490__, new_new_wc6__,
    new_new_n_515__, new_new_wc7__, new_new_n_537__, new_new_n_539__,
    new_new_n_541__, new_new_n_542__, new_new_n_543__, new_new_n_545__,
    new_new_n_546__, new_new_n_547__, new_new_n_535__, new_new_wc8__,
    new_new_n_534__, new_new_wc9__, new_new_n_549__, new_new_wc10__,
    new_new_n_544__, new_new_wc11__, new_new_n_558__, new_new_wc12__,
    new_new_n_565__, new_new_n_567__, new_new_n_569__, new_new_n_571__,
    new_new_n_573__, new_new_n_803__, new_new_wc13__, new_new_n_804__,
    new_new_wc14__, new_new_n_810__, new_new_wc15__, new_new_n_811__,
    new_new_wc16__, new_new_n_510__, new_new_n_513__, new_new_n_814__,
    new_new_wc17__, new_new_n_815__, new_new_wc18__, new_new_n_502__,
    new_new_n_501__, new_new_wc19__, new_new_n_753__, new_new_n_816__,
    new_new_wc20__, new_new_n_817__, new_new_wc21__, new_new_n_509__,
    new_new_n_751__, new_new_n_752__, new_new_n_744__, new_new_n_512__,
    new_new_n_818__, new_new_wc22__, new_new_n_819__, new_new_wc23__,
    new_new_n_494__, new_new_n_741__, new_new_wc24__, new_new_n_504__,
    new_new_wc25__, new_new_n_820__, new_new_n_821__, new_new_n_568__,
    new_new_n_729__, new_new_n_822__, new_new_wc26__, new_new_n_823__,
    new_new_wc27__, new_new_n_493__, new_new_n_771__, new_new_n_726__,
    new_new_wc28__, new_new_n_488__, new_new_wc29__, new_new_n_498__,
    new_new_n_774__, new_new_n_827__, new_new_n_828__, new_new_n_564__,
    new_new_n_714__, new_new_n_517__, new_new_n_520__, new_new_n_711__,
    new_new_wc30__, new_new_n_492__, new_new_wc31__, new_new_n_497__,
    new_new_n_636__, new_new_wc32__, new_new_n_699__, new_new_n_765__,
    new_new_n_648__, new_new_wc33__, new_new_n_829__, new_new_n_830__,
    new_new_n_572__, new_new_n_647__, new_new_wc34__, new_new_n_480__,
    new_new_wc35__, new_new_n_485__, new_new_n_696__, new_new_wc36__,
    new_new_n_635__, new_new_wc37__, new_new_n_646__, new_new_n_508__,
    new_new_wc38__, new_new_n_669__, new_new_n_634__, new_new_n_768__,
    new_new_n_831__, new_new_n_832__, new_new_n_570__, new_new_n_645__,
    new_new_n_484__, new_new_n_684__, new_new_n_633__, new_new_n_666__,
    new_new_wc39__, new_new_n_651__, new_new_n_681__, new_new_wc40__,
    new_new_n_575__, new_new_n_654__, new_new_n_833__, new_new_n_834__,
    new_new_n_566__, new_new_n_576__, new_new_n_762__, new_new_n_557__,
    new_new_wc41__, new_new_n_624__, new_new_wc42__, new_new_n_479__,
    new_new_n_835__, new_new_n_836__, new_new_n_574__, new_new_n_615__,
    new_new_n_560__, new_new_wc43__, new_new_n_777__, new_new_n_503__,
    new_new_n_507__, new_new_n_697__, new_new_wc44__, new_new_n_682__,
    new_new_wc45__, new_new_n_500__, new_new_n_614__, new_new_n_742__,
    new_new_wc46__, new_new_n_487__, new_new_n_613__, new_new_wc47__,
    new_new_n_495__, new_new_n_476__, new_new_n_623__, new_new_n_622__,
    new_new_n_712__, new_new_wc48__, new_new_n_556__, new_new_n_559__,
    new_new_n_603__, new_new_n_606__, new_new_n_667__, new_new_wc49__,
    new_new_n_491__, new_new_n_594__, new_new_n_743__, new_new_n_597__,
    new_new_n_759__, new_new_n_713__, new_new_n_758__, new_new_n_728__,
    new_new_n_727__, new_new_wc50__, new_new_n_683__, new_new_n_588__,
    new_new_n_478__, new_new_n_698__, new_new_n_600__, new_new_n_516__,
    new_new_n_591__, new_new_n_585__, new_new_n_519__, new_new_n_555__,
    new_new_wc51__, new_new_n_668__, new_new_n_837__, new_new_wc52__,
    new_new_n_838__, new_new_wc53__, new_new_n_483__, new_new_n_695__,
    new_new_n_839__, new_new_wc54__, new_new_n_840__, new_new_wc55__,
    new_new_n_486__, new_new_n_710__, new_new_n_841__, new_new_wc56__,
    new_new_n_842__, new_new_wc57__, new_new_n_562__, new_new_n_740__,
    new_new_n_843__, new_new_wc58__, new_new_n_844__, new_new_wc59__,
    new_new_n_499__, new_new_n_472__, new_new_n_845__, new_new_wc60__,
    new_new_n_846__, new_new_wc61__, new_new_n_496__, new_new_n_725__,
    new_new_n_518__, new_new_wc62__, new_new_n_563__, new_new_n_680__,
    new_new_n_582__, new_new_n_581__, new_new_wc63__, new_new_n_849__,
    new_new_wc64__, new_new_n_850__, new_new_wc65__, new_new_n_477__,
    new_new_n_851__, new_new_wc66__, new_new_n_852__, new_new_wc67__,
    new_new_n_475__, new_new_n_471__, new_new_wc68__, new_new_n_665__,
    new_new_wc69__, new_new_wc70__, new_new_wc71__, new_new_wc72__,
    new_new_wc73__, new_new_wc74__, new_new_wc75__, new_new_wc76__,
    new_new_wc77__;
  assign overflow = \y[7] ;
  assign new_new_n_505__ = new_new_wc__ | \a[1] ;
  assign new_new_wc__ = ~\b[1] ;
  assign new_new_n_506__ = \b[1]  | new_new_wc0__;
  assign new_new_wc0__ = ~\a[1] ;
  assign new_new_n_473__ = \b[2]  | new_new_wc1__;
  assign new_new_wc1__ = ~\a[2] ;
  assign new_new_n_474__ = new_new_wc2__ | \a[2] ;
  assign new_new_wc2__ = ~\b[2] ;
  assign new_new_n_481__ = \b[4]  | new_new_wc3__;
  assign new_new_wc3__ = ~\a[4] ;
  assign new_new_n_482__ = new_new_wc4__ | \a[4] ;
  assign new_new_wc4__ = ~\b[4] ;
  assign new_new_n_489__ = new_new_wc5__ | \a[3] ;
  assign new_new_wc5__ = ~\b[3] ;
  assign new_new_n_490__ = \b[3]  | new_new_wc6__;
  assign new_new_wc6__ = ~\a[3] ;
  assign \y[7]  = ~new_new_n_513__;
  assign new_new_n_515__ = \b[5]  | new_new_wc7__;
  assign new_new_wc7__ = ~\a[5] ;
  assign new_new_n_537__ = ~new_new_n_473__ | ~new_new_n_506__;
  assign new_new_n_539__ = ~new_new_n_474__ | ~new_new_n_505__;
  assign new_new_n_541__ = \a[2]  | new_new_n_475__;
  assign new_new_n_542__ = new_new_n_483__ | \a[3] ;
  assign new_new_n_543__ = new_new_n_477__ | \a[1] ;
  assign new_new_n_545__ = \a[4]  | new_new_n_486__;
  assign new_new_n_546__ = new_new_n_499__ | \a[6] ;
  assign new_new_n_547__ = new_new_n_496__ | \a[5] ;
  assign new_new_n_535__ = new_new_wc8__ | \a[6] ;
  assign new_new_wc8__ = ~\b[6] ;
  assign new_new_n_534__ = \b[6]  | new_new_wc9__;
  assign new_new_wc9__ = ~\a[6] ;
  assign new_new_n_549__ = \b[7]  | new_new_wc10__;
  assign new_new_wc10__ = ~\a[7] ;
  assign new_new_n_544__ = new_new_wc11__ | \a[7] ;
  assign new_new_wc11__ = ~\b[7] ;
  assign new_new_n_558__ = new_new_n_482__ | new_new_wc12__;
  assign new_new_wc12__ = ~new_new_n_515__;
  assign new_new_n_565__ = ~new_new_n_473__ | ~new_new_n_474__;
  assign new_new_n_567__ = ~new_new_n_535__ | ~new_new_n_534__;
  assign new_new_n_569__ = ~new_new_n_489__ | ~new_new_n_490__;
  assign new_new_n_571__ = ~new_new_n_481__ | ~new_new_n_482__;
  assign new_new_n_573__ = ~new_new_n_505__ | ~new_new_n_506__;
  assign new_new_n_803__ = new_new_wc13__ | new_new_n_510__;
  assign new_new_wc13__ = ~new_new_n_494__;
  assign new_new_n_804__ = new_new_n_494__ | new_new_wc14__;
  assign new_new_wc14__ = ~new_new_n_510__;
  assign parity = ~new_new_n_803__ | ~new_new_n_804__;
  assign new_new_n_810__ = new_new_wc15__ | new_new_n_509__;
  assign new_new_wc15__ = ~new_new_n_502__;
  assign new_new_n_811__ = new_new_n_502__ | new_new_wc16__;
  assign new_new_wc16__ = ~new_new_n_509__;
  assign new_new_n_510__ = ~new_new_n_810__ | ~new_new_n_811__;
  assign new_new_n_513__ = new_new_n_753__ | \op[1] ;
  assign new_new_n_814__ = new_new_wc17__ | new_new_n_501__;
  assign new_new_wc17__ = ~new_new_n_495__;
  assign new_new_n_815__ = new_new_n_495__ | new_new_wc18__;
  assign new_new_wc18__ = ~new_new_n_501__;
  assign new_new_n_502__ = ~new_new_n_814__ | ~new_new_n_815__;
  assign new_new_n_501__ = new_new_wc19__ | new_new_n_744__;
  assign new_new_wc19__ = ~new_new_n_743__;
  assign new_new_n_753__ = ~new_new_n_751__ | ~new_new_n_752__;
  assign new_new_n_816__ = new_new_wc20__ | new_new_n_508__;
  assign new_new_wc20__ = ~new_new_n_504__;
  assign new_new_n_817__ = new_new_n_504__ | new_new_wc21__;
  assign new_new_wc21__ = ~new_new_n_508__;
  assign new_new_n_509__ = ~new_new_n_816__ | ~new_new_n_817__;
  assign new_new_n_751__ = new_new_n_512__ | \op[0] ;
  assign new_new_n_752__ = ~new_new_n_512__ | ~\op[0] ;
  assign new_new_n_744__ = ~new_new_n_741__ | ~new_new_n_742__;
  assign new_new_n_512__ = ~new_new_n_594__ | ~new_new_n_771__;
  assign new_new_n_818__ = new_new_wc22__ | new_new_n_493__;
  assign new_new_wc22__ = ~new_new_n_480__;
  assign new_new_n_819__ = new_new_n_480__ | new_new_wc23__;
  assign new_new_wc23__ = ~new_new_n_493__;
  assign new_new_n_494__ = ~new_new_n_818__ | ~new_new_n_819__;
  assign new_new_n_741__ = new_new_wc24__ | \op[1] ;
  assign new_new_wc24__ = ~new_new_n_568__;
  assign new_new_n_504__ = new_new_wc25__ | new_new_n_729__;
  assign new_new_wc25__ = ~new_new_n_728__;
  assign new_new_n_820__ = ~new_new_n_500__ | ~new_new_n_498__;
  assign new_new_n_821__ = new_new_n_500__ | new_new_n_498__;
  assign new_new_n_568__ = ~new_new_n_820__ | ~new_new_n_821__;
  assign new_new_n_729__ = ~new_new_n_726__ | ~new_new_n_727__;
  assign new_new_n_822__ = new_new_wc26__ | new_new_n_492__;
  assign new_new_wc26__ = ~new_new_n_488__;
  assign new_new_n_823__ = new_new_n_488__ | new_new_wc27__;
  assign new_new_wc27__ = ~new_new_n_492__;
  assign new_new_n_493__ = ~new_new_n_822__ | ~new_new_n_823__;
  assign new_new_n_771__ = ~new_new_n_546__ | ~new_new_n_498__;
  assign new_new_n_726__ = new_new_wc28__ | \op[1] ;
  assign new_new_wc28__ = ~new_new_n_564__;
  assign new_new_n_488__ = new_new_wc29__ | new_new_n_714__;
  assign new_new_wc29__ = ~new_new_n_713__;
  assign new_new_n_498__ = ~new_new_n_597__ | ~new_new_n_774__;
  assign new_new_n_774__ = ~new_new_n_547__ | ~new_new_n_497__;
  assign new_new_n_827__ = ~new_new_n_503__ | ~new_new_n_497__;
  assign new_new_n_828__ = new_new_n_503__ | new_new_n_497__;
  assign new_new_n_564__ = ~new_new_n_827__ | ~new_new_n_828__;
  assign new_new_n_714__ = ~new_new_n_711__ | ~new_new_n_712__;
  assign new_new_n_517__ = new_new_n_636__ | new_new_n_516__;
  assign new_new_n_520__ = new_new_n_648__ | new_new_n_519__;
  assign new_new_n_711__ = new_new_wc30__ | \op[1] ;
  assign new_new_wc30__ = ~new_new_n_572__;
  assign new_new_n_492__ = new_new_wc31__ | new_new_n_699__;
  assign new_new_wc31__ = ~new_new_n_698__;
  assign new_new_n_497__ = ~new_new_n_588__ | ~new_new_n_765__;
  assign new_new_n_636__ = new_new_n_635__ | new_new_wc32__;
  assign new_new_wc32__ = ~new_new_n_515__;
  assign new_new_n_699__ = ~new_new_n_696__ | ~new_new_n_697__;
  assign new_new_n_765__ = ~new_new_n_545__ | ~new_new_n_485__;
  assign new_new_n_648__ = new_new_n_647__ | new_new_wc33__;
  assign new_new_wc33__ = ~new_new_n_518__;
  assign new_new_n_829__ = ~new_new_n_487__ | ~new_new_n_485__;
  assign new_new_n_830__ = new_new_n_487__ | new_new_n_485__;
  assign new_new_n_572__ = ~new_new_n_829__ | ~new_new_n_830__;
  assign new_new_n_647__ = new_new_n_646__ | new_new_wc34__;
  assign new_new_wc34__ = ~new_new_n_489__;
  assign new_new_n_480__ = new_new_wc35__ | new_new_n_669__;
  assign new_new_wc35__ = ~new_new_n_668__;
  assign new_new_n_485__ = ~new_new_n_591__ | ~new_new_n_768__;
  assign new_new_n_696__ = new_new_wc36__ | \op[1] ;
  assign new_new_wc36__ = ~new_new_n_570__;
  assign new_new_n_635__ = new_new_n_634__ | new_new_wc37__;
  assign new_new_wc37__ = ~new_new_n_490__;
  assign new_new_n_646__ = ~new_new_n_645__ | ~new_new_n_482__;
  assign new_new_n_508__ = new_new_wc38__ | new_new_n_684__;
  assign new_new_wc38__ = ~new_new_n_683__;
  assign new_new_n_669__ = ~new_new_n_666__ | ~new_new_n_667__;
  assign new_new_n_634__ = ~new_new_n_633__ | ~new_new_n_481__;
  assign new_new_n_768__ = ~new_new_n_542__ | ~new_new_n_484__;
  assign new_new_n_831__ = ~new_new_n_491__ | ~new_new_n_484__;
  assign new_new_n_832__ = new_new_n_491__ | new_new_n_484__;
  assign new_new_n_570__ = ~new_new_n_831__ | ~new_new_n_832__;
  assign new_new_n_645__ = ~new_new_n_576__ | ~new_new_n_490__;
  assign new_new_n_484__ = ~new_new_n_585__ | ~new_new_n_762__;
  assign new_new_n_684__ = ~new_new_n_681__ | ~new_new_n_682__;
  assign new_new_n_633__ = ~new_new_n_575__ | ~new_new_n_489__;
  assign new_new_n_666__ = new_new_wc39__ | \op[1] ;
  assign new_new_wc39__ = ~new_new_n_566__;
  assign new_new_n_651__ = ~new_new_n_557__ | ~new_new_n_556__;
  assign new_new_n_681__ = new_new_wc40__ | \op[1] ;
  assign new_new_wc40__ = ~new_new_n_574__;
  assign new_new_n_575__ = ~new_new_n_614__ | ~new_new_n_615__;
  assign new_new_n_654__ = ~new_new_n_560__ | ~new_new_n_559__;
  assign new_new_n_833__ = ~new_new_n_476__ | ~new_new_n_479__;
  assign new_new_n_834__ = new_new_n_476__ | new_new_n_479__;
  assign new_new_n_566__ = ~new_new_n_833__ | ~new_new_n_834__;
  assign new_new_n_576__ = ~new_new_n_623__ | ~new_new_n_624__;
  assign new_new_n_762__ = ~new_new_n_541__ | ~new_new_n_479__;
  assign new_new_n_557__ = new_new_n_519__ | new_new_wc41__;
  assign new_new_wc41__ = ~new_new_n_603__;
  assign new_new_n_624__ = new_new_n_622__ | new_new_wc42__;
  assign new_new_wc42__ = ~\b[0] ;
  assign new_new_n_479__ = ~new_new_n_600__ | ~new_new_n_777__;
  assign new_new_n_835__ = ~new_new_n_478__ | ~new_new_n_507__;
  assign new_new_n_836__ = new_new_n_478__ | new_new_n_507__;
  assign new_new_n_574__ = ~new_new_n_835__ | ~new_new_n_836__;
  assign new_new_n_615__ = new_new_n_613__ | \b[0] ;
  assign new_new_n_560__ = new_new_n_516__ | new_new_wc43__;
  assign new_new_wc43__ = ~new_new_n_606__;
  assign new_new_n_777__ = ~new_new_n_478__ | ~new_new_n_543__;
  assign new_new_n_503__ = ~new_new_n_547__ | ~new_new_n_597__;
  assign new_new_n_507__ = ~new_new_n_543__ | ~new_new_n_600__;
  assign new_new_n_697__ = new_new_wc44__ | new_new_n_472__;
  assign new_new_wc44__ = ~new_new_n_569__;
  assign new_new_n_682__ = new_new_wc45__ | new_new_n_472__;
  assign new_new_wc45__ = ~new_new_n_573__;
  assign new_new_n_500__ = ~new_new_n_546__ | ~new_new_n_594__;
  assign new_new_n_614__ = ~new_new_n_474__ | ~new_new_n_537__;
  assign new_new_n_742__ = new_new_wc46__ | new_new_n_472__;
  assign new_new_wc46__ = ~new_new_n_567__;
  assign new_new_n_487__ = ~new_new_n_545__ | ~new_new_n_588__;
  assign new_new_n_613__ = new_new_n_539__ | new_new_wc47__;
  assign new_new_wc47__ = ~\a[0] ;
  assign new_new_n_495__ = ~new_new_n_758__ | ~new_new_n_759__;
  assign new_new_n_476__ = ~new_new_n_541__ | ~new_new_n_585__;
  assign new_new_n_623__ = ~new_new_n_473__ | ~new_new_n_539__;
  assign new_new_n_622__ = new_new_n_537__ | \a[0] ;
  assign new_new_n_712__ = new_new_wc48__ | new_new_n_472__;
  assign new_new_wc48__ = ~new_new_n_571__;
  assign new_new_n_556__ = ~new_new_n_516__ | ~new_new_n_544__;
  assign new_new_n_559__ = ~new_new_n_519__ | ~new_new_n_549__;
  assign new_new_n_603__ = ~new_new_n_555__ | ~new_new_n_515__;
  assign new_new_n_606__ = ~new_new_n_558__ | ~new_new_n_518__;
  assign new_new_n_667__ = new_new_wc49__ | new_new_n_472__;
  assign new_new_wc49__ = ~new_new_n_565__;
  assign new_new_n_491__ = ~new_new_n_542__ | ~new_new_n_591__;
  assign new_new_n_594__ = ~new_new_n_499__ | ~\a[6] ;
  assign new_new_n_743__ = new_new_n_740__ | new_new_n_471__;
  assign new_new_n_597__ = ~new_new_n_496__ | ~\a[5] ;
  assign new_new_n_759__ = ~new_new_n_562__ | ~new_new_n_471__;
  assign new_new_n_713__ = new_new_n_710__ | new_new_n_471__;
  assign new_new_n_758__ = new_new_n_582__ | new_new_n_471__;
  assign new_new_n_728__ = new_new_n_725__ | new_new_n_471__;
  assign new_new_n_727__ = new_new_wc50__ | new_new_n_472__;
  assign new_new_wc50__ = ~new_new_n_563__;
  assign new_new_n_683__ = new_new_n_680__ | new_new_n_471__;
  assign new_new_n_588__ = ~new_new_n_486__ | ~\a[4] ;
  assign new_new_n_478__ = ~new_new_n_581__ | ~new_new_n_582__;
  assign new_new_n_698__ = new_new_n_695__ | new_new_n_471__;
  assign new_new_n_600__ = ~new_new_n_477__ | ~\a[1] ;
  assign new_new_n_516__ = ~new_new_n_549__ | ~new_new_n_534__;
  assign new_new_n_591__ = ~new_new_n_483__ | ~\a[3] ;
  assign new_new_n_585__ = ~new_new_n_475__ | ~\a[2] ;
  assign new_new_n_519__ = ~new_new_n_544__ | ~new_new_n_535__;
  assign new_new_n_555__ = new_new_n_481__ | new_new_wc51__;
  assign new_new_wc51__ = ~new_new_n_518__;
  assign new_new_n_668__ = new_new_n_665__ | new_new_n_471__;
  assign new_new_n_837__ = new_new_wc52__ | \b[3] ;
  assign new_new_wc52__ = ~\op[0] ;
  assign new_new_n_838__ = \op[0]  | new_new_wc53__;
  assign new_new_wc53__ = ~\b[3] ;
  assign new_new_n_483__ = ~new_new_n_837__ | ~new_new_n_838__;
  assign new_new_n_695__ = ~\b[3]  | ~\a[3] ;
  assign new_new_n_839__ = new_new_wc54__ | \b[4] ;
  assign new_new_wc54__ = ~\op[0] ;
  assign new_new_n_840__ = \op[0]  | new_new_wc55__;
  assign new_new_wc55__ = ~\b[4] ;
  assign new_new_n_486__ = ~new_new_n_839__ | ~new_new_n_840__;
  assign new_new_n_710__ = ~\b[4]  | ~\a[4] ;
  assign new_new_n_841__ = new_new_wc56__ | \b[0] ;
  assign new_new_wc56__ = ~\a[0] ;
  assign new_new_n_842__ = \a[0]  | new_new_wc57__;
  assign new_new_wc57__ = ~\b[0] ;
  assign new_new_n_562__ = ~new_new_n_841__ | ~new_new_n_842__;
  assign new_new_n_740__ = ~\b[6]  | ~\a[6] ;
  assign new_new_n_843__ = new_new_wc58__ | \b[6] ;
  assign new_new_wc58__ = ~\op[0] ;
  assign new_new_n_844__ = \op[0]  | new_new_wc59__;
  assign new_new_wc59__ = ~\b[6] ;
  assign new_new_n_499__ = ~new_new_n_843__ | ~new_new_n_844__;
  assign new_new_n_472__ = ~\op[1]  | ~\op[0] ;
  assign new_new_n_845__ = new_new_wc60__ | \b[5] ;
  assign new_new_wc60__ = ~\op[0] ;
  assign new_new_n_846__ = \op[0]  | new_new_wc61__;
  assign new_new_wc61__ = ~\b[5] ;
  assign new_new_n_496__ = ~new_new_n_845__ | ~new_new_n_846__;
  assign new_new_n_725__ = ~\b[5]  | ~\a[5] ;
  assign new_new_n_518__ = \a[5]  | new_new_wc62__;
  assign new_new_wc62__ = ~\b[5] ;
  assign new_new_n_563__ = ~new_new_n_515__ | ~new_new_n_518__;
  assign new_new_n_680__ = ~\b[1]  | ~\a[1] ;
  assign new_new_n_582__ = ~\a[0]  | ~\b[0] ;
  assign new_new_n_581__ = \b[0]  | new_new_wc63__;
  assign new_new_wc63__ = ~\op[0] ;
  assign new_new_n_849__ = new_new_wc64__ | \b[1] ;
  assign new_new_wc64__ = ~\op[0] ;
  assign new_new_n_850__ = \op[0]  | new_new_wc65__;
  assign new_new_wc65__ = ~\b[1] ;
  assign new_new_n_477__ = ~new_new_n_849__ | ~new_new_n_850__;
  assign new_new_n_851__ = new_new_wc66__ | \b[2] ;
  assign new_new_wc66__ = ~\op[0] ;
  assign new_new_n_852__ = \op[0]  | new_new_wc67__;
  assign new_new_wc67__ = ~\b[2] ;
  assign new_new_n_475__ = ~new_new_n_851__ | ~new_new_n_852__;
  assign new_new_n_471__ = new_new_wc68__ | \op[0] ;
  assign new_new_wc68__ = ~\op[1] ;
  assign new_new_n_665__ = ~\b[2]  | ~\a[2] ;
  assign is_eq = ~new_new_n_517__ & ~new_new_n_520__;
  assign less = new_new_wc69__ & new_new_n_520__;
  assign new_new_wc69__ = ~new_new_n_651__;
  assign greater = new_new_wc70__ & new_new_n_517__;
  assign new_new_wc70__ = ~new_new_n_654__;
  assign \y[5]  = new_new_n_504__ & new_new_wc71__;
  assign new_new_wc71__ = ~new_new_n_513__;
  assign \y[2]  = new_new_n_480__ & new_new_wc72__;
  assign new_new_wc72__ = ~new_new_n_513__;
  assign \y[1]  = new_new_n_508__ & new_new_wc73__;
  assign new_new_wc73__ = ~new_new_n_513__;
  assign \y[6]  = new_new_n_501__ & new_new_wc74__;
  assign new_new_wc74__ = ~new_new_n_513__;
  assign \y[4]  = new_new_n_488__ & new_new_wc75__;
  assign new_new_wc75__ = ~new_new_n_513__;
  assign \y[3]  = new_new_n_492__ & new_new_wc76__;
  assign new_new_wc76__ = ~new_new_n_513__;
  assign \y[0]  = new_new_n_495__ & new_new_wc77__;
  assign new_new_wc77__ = ~new_new_n_513__;
endmodule


