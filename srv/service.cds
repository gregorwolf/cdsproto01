using {
    Environments as environments,
    Fakes        as fakes
} from '../db/schema';

@path : 'system'
@(requires : 'authenticated-user')
service SystemService {

    @odata.draft.enabled
    @(restrict : [{
        grant : '*',
        to    : 'modeler',
        // Working:
        // where : 'createdBy = $user'
        // Working:
        where : `team = $user.teams`
        // TypeError: a.match is not a function in @sap/cds/libx/_runtime/common/generic/auth/utils.js:85:60
        // where : `team = $user.environments.SXP0012.teams`
        // ?
        // where : `$user.environments.SXP0012.teams = 'auditor'`
    }])
    entity Environments as projection on environments;

    @odata.draft.enabled
    entity Fakes        as projection on fakes actions {
        action assignDraftToCurrentUser() returns Fakes
    };

    @odata.singleton
    @cds.persistency.skip
    @readonly
    entity User {
        key id     : String;
            attr   : String;
            locale : String;
            _roles : String;
    };

    function readJWT()    returns String;
    action   createFake() returns String;
}
