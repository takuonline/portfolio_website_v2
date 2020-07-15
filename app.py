from website import app
from website.fakenews_app.functions import text_process  # just needs to be here


if __name__ == "__main__":

    app.run(debug=True)
