"
This makes facilitate metrics extraction from .json files
"
Class {
	#name : #MGLMetricsExtractor,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #MGLMetricsExtractor
}

{ #category : #extraction }
MGLMetricsExtractor >> extractTo: outputFileName [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	| statementsfiles model count allClassesWMC noc nocd fanIn fanOut cbo|
	statementsfiles := path asFileReference children .
	outputFileName asFileReference writeStreamDo:[:output |
		output truncate.
		output << 'commit'.
		output << ','.
		output << 'avg_wmc'.
		output << ','.
		output << 'avg_noc'.
		output << ','.
		output << 'avg_nocd'.
		output << ','.
		output << 'avg_fan_in'.
		output << ','.
		output << 'avg_fan_out'.
		output << ','.
		output << 'avg_cbo'.
		output << ','.
		output << 'n_classes'.
		output << String cr .
		statementsfiles do: 
			[:file | 
				model := file asFileReference readStreamDo: 
				[ :stream | 
					model := FamixTypeScriptModel new importFromJSONStream: stream. 
				].
			count := model allClasses numberOfEntities .
			allClassesWMC := model allClasses sum: #weightedMethodCount.
			noc := (model allClasses sum: #numberOfChildren) .
			nocd := (model allClasses sum: #numberOfChildren) .
			fanIn := (model allClasses sum: #fanIn) .
			fanOut := (model allClasses sum: #fanOut) .
			cbo := fanIn + fanOut.
			output << file basename.
			output << ','.
			output << allClassesWMC asString.
			output << ','.
			output << noc asString.
			output << ','.
			output << nocd asString.
			output << ','.
			output << fanIn asString.
			output << ','.
			output << fanOut asString.
			output << ','.
			output << cbo asString.
			output << ','.
			output << count asString.
			output << String cr .
		]
	]

]

{ #category : #accesing }
MGLMetricsExtractor >> path [
	"return the path with models"
	"scope: class-variables  &  instance-variables"	
	^ path
]

{ #category : #accessing }
MGLMetricsExtractor >> path: anObject [
	path := anObject
]
