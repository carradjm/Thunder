class Api::SearchController < ApplicationController
  
  def search
    if !params[:query].blank?
      @results = PgSearch.multisearch(params[:query])
                         .includes(:searchable)
    else
      @results = PgSearch::Document.all
    end
  end
  
end