using {
    managed,
    Currency,
    temporal,
    Country,
    extensible,
    cuid,
    sap.common.CodeList
} from '@sap/cds/common';

entity Fakes : cuid {
    test    : String;
    // _Items  : Composition of many Items
    //               on _Items._Fakes = $self;
    _Items2 : Association to many Items2
                  on _Items2._Fakes = $self;
}

entity Environments : managed {
    key ID      : UUID @odata.Type : 'Edm.String';
        descr   : String;
        team    : String;
        _Items  : Composition of many Items
                      on _Items._Environments = $self;
        _Items2 : Association to many Items2
                      on _Items2._Environments = $self;
}

entity Items {
    _Environments : Association to one Environments;
    _Fakes        : Association to one Fakes;
    test          : String;
}

entity Items2 {
    _Environments : Association to one Environments;
    _Fakes        : Association to one Fakes;
    test          : String;
}
