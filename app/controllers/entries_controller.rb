class EntriesController < ApplicationController
    
    def index 
        @entries = Entry.all 
         json_response(@entries)
    end

    def show
        @entry = Entry.find(params[:id])
        json_response(@entry)
    end

    def create
        @entry = Entry.create!(entry_params)
        json_response(@entry, :created)
    end

    def update
        @entry = Entry.find(params[:id])
        @entry.update!(entry_params)
        if @entry.update!(entry_params)
            render status: 200, json: {
                message: "The entry has been successfully updated!"
            }
        end
    end
    
    def destroy
        @entry = Entry.find(params[:id])
        @entry.destroy
        if @entry.destroy!
            render status: 200, json: {
                message: "The entry has been deleted."
            }   
         end
    end

    private

    def json_response(object, status = :ok)
        render json: object, status: status
    end

    def entry_params
       params.permit(:prompt1, :prompt2, :prompt3, :content) 
    end

end