class CommentsController < ApplicationController
  before_filter :load_chart

  def create
    @comment = @chart.comments.new(params[:comment])
    if @comment.save
      redirect_to @chart, :notice => 'Thanks for your comment'
    else
      redirect_to @chart, :alert => 'Unable to add comment'
    end
  end

  def destroy
    @comment = @chart.comments.find(params[:id])
    @comment.destroy
    redirect_to @chart, :notice => 'Comment deleted'
  end

  private
    def load_chart
      @chart = Chart.find(params[:chart_id])
    end
end