class HelloController < ApplicationController
    def view
        render plain: 'Hello, world!'
    end
end
