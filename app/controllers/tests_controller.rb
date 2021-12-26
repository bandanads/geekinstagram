class TestsController < ApplicationController
  before_action :authenticate_user!  
    def index
        @tests =Test.all

      if params[:search] != nil && params[:search] !=''
        @tests = Test.where("body LIKE ? ",'%' + params[:search] + '%')
      else
        @tests =Test.all
      end
    end

    def new
        @test = Test.new
    end

    def create
        test = Test.new(test_params)

        test.user_id = current_user.id
        if test.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

    def show
      @test = Test.find(params[:id])
      @comments = @test.comments
      @comment = Comment.new
    end

    def edit
      @test = Test.find(params[:id])
    end

    def update
      test = Test.find(params[:id])
      if test.update(test_params)
        redirect_to :action => "show", :id => test.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      test = Test.find(params[:id])
      test.destroy
      redirect_to action: :index
    end

    private
    def test_params
      params.require(:test).permit(:body, :image)
    end
end
