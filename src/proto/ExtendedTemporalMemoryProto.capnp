@0xa66e0e8cf587a316;

# TODO: Use absolute path
using import "/proto/ConnectionsProto.capnp".ConnectionsProto;
using import "/proto/RandomProto.capnp".RandomProto;

# Next ID: 24
struct ExtendedTemporalMemoryProto {

  struct SegmentPath {
    cell @0 :UInt32;
    idxOnCell @1 :UInt32;
  }

  struct SegmentUInt32Pair {
    cell @0 :UInt32;
    idxOnCell @1 :UInt32;
    number @2 :UInt32;
  }

  struct SegmentUInt64Pair {
    cell @0 :UInt32;
    idxOnCell @1 :UInt32;
    number @2 :UInt64;
  }

  columnDimensions @0 :List(UInt32);
  cellsPerColumn @1 :UInt32;
  activationThreshold @2 :UInt32;
  initialPermanence @3 :Float32;
  connectedPermanence @4 :Float32;
  minThreshold @5 :UInt32;
  maxNewSynapseCount @6 :UInt32;
  permanenceIncrement @7 :Float32;
  permanenceDecrement @8 :Float32;
  predictedSegmentDecrement @9 :Float32;
  maxSegmentsPerCell @10 :UInt16;
  maxSynapsesPerSegment @11 :UInt16;
  formInternalBasalConnections @12 :Bool;

  basalConnections @13 :ConnectionsProto;
  apicalConnections @14 :ConnectionsProto;
  random @15 :RandomProto;

  # Lists of indices
  activeCells @16 :List(UInt32);
  winnerCells @17 :List(UInt32);
  predictedActiveCells @18 :List(UInt32);

  activeBasalSegments @19 :List(SegmentPath);
  matchingBasalSegments @20 :List(SegmentPath);
  activeApicalSegments @21 :List(SegmentPath);
  matchingApicalSegments @22 :List(SegmentPath);

  numActivePotentialSynapsesForBasalSegment @23 :List(SegmentUInt32Pair);
  numActivePotentialSynapsesForApicalSegment @24 :List(SegmentUInt32Pair);

  iteration @25 :UInt64;
  lastUsedIterationForBasalSegment @26 :List(SegmentUInt64Pair);
  lastUsedIterationForApicalSegment @27 :List(SegmentUInt64Pair);

  learnOnOneCell @28 :Bool;
  chosenCellForColumn @29 :List(ChosenCellPair);

  numBasalInputs @30:UInt16;
  numApicalInputs @31:UInt16;

  # Next ID: 2
  struct ChosenCellPair {
    columnIdx @0 :UInt32;
    cellIdx @1 :UInt32;
  }
}
