import { Button, Header, Icon, Modal } from "semantic-ui-react"
import { IDeleteModalProp } from "../models/Interfaces/IGlobalCode";

const DeleteModal = ({ isOpen, setCloseModal }: IDeleteModalProp) => {
    return (
        <Modal

            open={isOpen}
            size='tiny'
        >

            <Modal.Content>
                <p>
                    Are you sure you want to delete todo item
                </p>
            </Modal.Content>
            <Modal.Actions>
                <Button color='red' inverted onClick={() => setCloseModal(false)}>
                    <Icon name='remove' /> Cancle
                </Button>
                <Button color='green' inverted onClick={() => setCloseModal(true)}>
                    <Icon name='checkmark' /> Confirm
                </Button>
            </Modal.Actions>
        </Modal>
    )
}

export default DeleteModal;
