class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Plutus::Account.includes(:entries)
    if params[:type]
      @accounts = @accounts.where(type: params[:type])
    end
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @account = @account.becomes(Account)
  end

  # GET /accounts/new
  def new
    @account = Plutus::Account.new.becomes(Account)
  end

  # GET /accounts/1/edit
  def edit
    @account = @account.becomes(Account)
  end

  # POST /accounts or /accounts.json
  def create
    @account = Plutus::Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.entries.any? || params[:account][:type]
        format.html { render :edit, status: :unprocessable_entity }
      elsif @account.update(name: params[:account][:name])
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Plutus::Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :type)
    end
end
