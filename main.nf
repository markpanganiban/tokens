process emmiter {
    label 'minor'
    container 'quay.io/nextflow/bash'
    
    output:
    env(test) into emmiter_test_ch

    script:
    """
    test=aBigTest
    """
}

process test_github_secret {
    label 'mezzo'
    container 'quay.io/nextflow/bash'

    secret 'GitHub_token'

    input:
    val(test) from emmiter_test_ch
    
    output:
    env(token) into test_ch

    script:
    """
    token=\$(echo \$GitHub_token ${test})
    """
}
