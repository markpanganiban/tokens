Channel
    .from('aBigTest')
    .set{ emmiter_test_ch }
    
process test_github_secret {
    label 'mezzo'
    container 'dovetailg/prod-report'

    secret 'GitHub_token'

    input:
    val(test) from emmiter_test_ch
    
    output:
    env(token) into test_ch

    script:
    """
    token=\$(echo \$GitHub_token ${test}) \
    """
}
test_ch.view()
