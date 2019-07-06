class Backend::QuestionsController < BackendController
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    before_action :authenticate_admin!
    before_action :load_question, only: [:edit, :update, :destroy]

    def index
        @question = params[:question]

        @questions = Question.with_translations(I18n.locale).order('created_at DESC').page params[:page]
        @questions = @questions.where('question_translations.request ILIKE ?', "%#{@question}%") if @question.present?
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)

        if @question.save
            flash.notice = t('backend.questions.created', question: @question.request)
            redirect_to backend_questions_path
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        if @question.update(question_params)
            flash.notice = t('backend.questions.edited', question: @question.request)
            redirect_to backend_questions_path
        else
            render :edit
        end
    end

    def destroy
        @question.destroy
        flash.alert = t('backend.questions.removed', question: @question.request)
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
