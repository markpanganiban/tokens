nextflow.enable.dsl=1

process test_github_secret {

    secret 'GitHub_token'

    output:
    env(token) into emmiter_test_ch

    script:
    """
    token=\$(echo \$GitHub_token \$test)
    """
}

process emmiter {    
    input:
    env(token) from emmiter_test_ch
    
    script:
    """
    test=aBigTest
    """
}
