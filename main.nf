nextflow.enable.dsl=1

process emmiter {    

    secret 'GitHub_token'

    output:
    env(test) into emmiter_test_ch

    script:
    """
    test=aBigTest
    """
}

process test_github_secret {

    secret 'GitHub_token'

    input:
    env(test) from emmiter_test_ch
    
    output:
    env(token) into test_ch

    script:
    """
    token=\$(echo \$GitHub_token \$test)
    """
}
