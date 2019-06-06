class Backend::QuestionsController < BackendController
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    before_action :authenticate_admin!
    before_action :load_question, only: [:edit, :update, :destroy]

    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        if @question.save
            flash.notice = 'Faq creata con successo'
            redirect_to backend_questions_path
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        if @question.update(question_params)
            flash.notice = 'Faq modificata con successo'
            redirect_to backend_questions_path
        else
            render :edit
        end
    end

    def destroy
        @question.destroy
        redirect_to backend_questions_path
    end

    def load_question
        @question = Question.friendly.find(params[:id])
    end

    private

    def question_params
        params.require(:question).permit(:request, :reply)
    end
end
