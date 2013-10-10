define

    # Page layout. Defines container for the boards
    emailsLayout:
        render:
            template:
                module: 'text!/views/allemail/layout.html'

        insert:
            at:
                $ref: 'dom.first!#content'
                at: 'layout'

    collection:
        create:
            module: 'js/components/lib/emailcollection'

        properties:
            url: 'json/allmail.json'

        init: 'initialFetch'

    viewModel:
        create:
            module: 'js/components/allemail/viewmodel'        

        properties:
            emailCollection: $ref: 'collection'
        
        knockout:
            bind: 'emailsLayout'

        init: 'testFunction'


    plugins: [
        # { module: 'wire/debug', trace: false }
        { module: 'wire/dom' }
        { module: 'wire/dom/render' }
        { module: 'wire/connect'}
        { module: 'js/components/knockout/knockout'}
    ]
