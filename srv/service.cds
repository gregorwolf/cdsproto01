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
        // where : 'createdBy = $user'
        // where : `$user.environments.SXP0012.teams = 'auditor'`
    }])
    entity Environments as projection on environments;

    @odata.draft.enabled
    entity Fakes        as projection on fakes;

    action createFake() returns String;
}
