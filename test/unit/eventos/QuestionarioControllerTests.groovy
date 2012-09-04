package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(QuestionarioController)
@Mock(Questionario)
class QuestionarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/questionario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.questionarioInstanceList.size() == 0
        assert model.questionarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.questionarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.questionarioInstance != null
        assert view == '/questionario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/questionario/show/1'
        assert controller.flash.message != null
        assert Questionario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/questionario/list'

        populateValidParams(params)
        def questionario = new Questionario(params)

        assert questionario.save() != null

        params.id = questionario.id

        def model = controller.show()

        assert model.questionarioInstance == questionario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/questionario/list'

        populateValidParams(params)
        def questionario = new Questionario(params)

        assert questionario.save() != null

        params.id = questionario.id

        def model = controller.edit()

        assert model.questionarioInstance == questionario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/questionario/list'

        response.reset()

        populateValidParams(params)
        def questionario = new Questionario(params)

        assert questionario.save() != null

        // test invalid parameters in update
        params.id = questionario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/questionario/edit"
        assert model.questionarioInstance != null

        questionario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/questionario/show/$questionario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        questionario.clearErrors()

        populateValidParams(params)
        params.id = questionario.id
        params.version = -1
        controller.update()

        assert view == "/questionario/edit"
        assert model.questionarioInstance != null
        assert model.questionarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/questionario/list'

        response.reset()

        populateValidParams(params)
        def questionario = new Questionario(params)

        assert questionario.save() != null
        assert Questionario.count() == 1

        params.id = questionario.id

        controller.delete()

        assert Questionario.count() == 0
        assert Questionario.get(questionario.id) == null
        assert response.redirectedUrl == '/questionario/list'
    }
}
