define

    # Page layout. Defines container for the boards
    emailLayout:
        render:
            template:
                module: 'text!/views/singleemail/layout.html'

        insert:
            at:
                $ref: 'dom.first!#content'
                at: 'layout'

    model:
        create:
            module: 'js/components/singleemail/model.js'

        properties:
            url: 'json/singleemail.json'
            vars: $ref: 'vars'

        init: 'initialFetch'

    viewModel:
        create:
            module: 'js/components/singleemail/viewmodel'        
            args: [$ref: 'model']

        init: 'loadViewModel'
        
        knockout:
            bind: 'emailLayout'

    plugins: [
        # { module: 'wire/debug', trace: false }
        { module: 'wire/dom' }
        { module: 'wire/dom/render' }
        { module: 'wire/connect'}
        { module: 'js/components/knockout/knockout'}
    ]
