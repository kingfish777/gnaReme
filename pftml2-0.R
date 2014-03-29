<!ELEMENT Folktale (Move+)>
<!ATTLIST Folktale
	Title CDATA #REQUIRED
>

<!--      

 "Morphologically, a tale (skazka) may be termed any development proceeding 
 from villainy (A) or a lack (a), through intermediary functions to marriage (W*),  
 or to other functions employed as a denouement.  Terminal functions are at  times 
 a reward (F), a gain or in general the liquidation of misfortune (K), an escape from pursuit
 (Rs), etc.  This type of development is termed by us a move (khod).  Each new act of villainy, 
 each new lack creates a new move ....  when analyzing a text, one must first of all determine 
 the number of moves of which a tale consists....  However, if we have conditionally 
 defined the tale as a move, this still does not mean that the
 number of moves corresponds to the number of tales.  Special devices of parallelism,  
 repetitions, etc., lead to the fact that one tale may be composed of several  moves." 
  pg. 92, "the Ways in which Stories are combined" -->

<!ELEMENT Move (Preparation?, 
	(Villainy | 
	Lack)?, 
	ConnectiveIncident?, 
	ConsentToCounteraction?, 
	Move?, 
	Departure?, 
	DonorFunctions?, 
	Transference?,
	StruggleVictory?, 
	LiquidationOfLack?, 
	Move?, 
	Return?, 
	PursuitRescueOfHero?, 
	UnrecognizedArrival?, 
	ClaimsOfFalseHero? 
	LiquidationOfLack?, 
	Return?, 
	PursuitRescueOfHero?, 
	UnrecognizedArrival?, 
	ClaimsOfFalseHero?, 
	Task?,
	Wedding?, 
	RecognitionOfHero?, 
	ExposureOfFalseHero?, 
	Transfiguration?, 
	PunishmentOfFalseHero?, 
	AlienForms?,
	RecognitionOfHero?, 
	ExposureOfFalseHero?, 
	Transfiguration?, 
	PunishmentOfFalseHero?, 
	Wedding?, 
	AlienForms?, 
	Return?, 
	Epilogue?>
<!-- CONTENT MODEL -->
<!ELEMENT Preparation>
<!ELEMENT Preparation (#PCDATA)>
<!ELEMENT Villainy (#PCDATA)>
<!ELEMENT Lack (#PCDATA)>
<!ELEMENT ConnectiveIncident (#PCDATA)>
<!ELEMENT ConsentToCounteraction (#PCDATA)>
<!ELEMENT Departure (#PCDATA)>
<!ELEMENT DonorFunctions (#PCDATA)>
<!ELEMENT StruggleVictory (#PCDATA)>
<!ELEMENT LiquidationOfLack (#PCDATA)>
<!ELEMENT Return (#PCDATA)>
<!ELEMENT PursuitRescueOfHero (#PCDATA)>
<!ELEMENT UnrecognizedArrival (#PCDATA)>
<!ELEMENT ClaimsOfFalseHero (#PCDATA)>
<!ELEMENT Task (#PCDATA)>
<!ELEMENT RecognitionOfHero (#PCDATA)>
<!ELEMENT ExposureOfFalseHero (#PCDATA)>
<!ELEMENT Transfiguration (#PCDATA)>
<!ELEMENT PunishmentOfFalseHero (#PCDATA)>
<!ELEMENT Wedding (#PCDATA)>
<!ELEMENT AlienForms (#PCDATA)>
<!ELEMENT Epilogue (#PCDATA)>
