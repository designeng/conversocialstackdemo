define

    # Page layout. Defines container for the boards
    layout:
        render:
            template:
                module: 'text!views/layout.html'
            css:
                module: 'css!css/bootstrap.css,css/layout.css'
        insert:
            at:
                $ref: 'dom.first!body'

    viewModel:
        create:
            module: 'js/components/navbar/viewmodel'
        knockout:
            bind: 'layout'       

    router:
        bbRouter: 
            routes:            
                '':  'js/components/allemail/spec'
                'archive': 'js/components/archive/spec'
                'email/:id': 'js/components/singleemail/spec'
        bbConnect:
            'route': 'viewModel.changeRoute'

    plugins: [
        # { module: 'wire/debug', trace: false }
        { module: 'wire/dom' }
        { module: 'wire/dom/render' }
        { module: 'wire/connect'}
        { module: 'js/components/bbrouter/module'}
        { module: 'js/components/knockout/knockout'}
        { module: 'js/components/bbconnect/bbconnect'}
    ]
