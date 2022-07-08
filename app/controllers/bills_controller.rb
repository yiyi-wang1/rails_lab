class BillsController < ApplicationController
    def initialize
        @total
    end

    def new_bill #this is to show the form page
    end

    def split_bill #this is to actually create
        p params
        @amount = params[:amount].to_f
        @tax = params[:tax].to_f
        @tip = params[:tip].to_f
        @number_of_guests = params[:number_of_guests].to_i

        @total = (@amount*(@tax/100+1)*(@tip/100+1)/@number_of_guests).round(2)
        render :new_bill
    end
end
