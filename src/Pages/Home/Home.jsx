import { React, useContext } from 'react'
import Introduction from '../../Components/Intro/Introduction'
import ResumeContext from '../../Context/ResumeContext';


const Home = () => {
    const { currentTheme, showComponent, themeData, componentRef } = useContext(ResumeContext);

    return (
        <>
            {
                !showComponent && <Introduction />
            }
            
        </>
    )
}

export default Home
